//
//  LoginViewController.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 7/26/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit
import Hero
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var backgroundPatternImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextField: SphaerTextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: SphaerTextField!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    
    @IBOutlet weak var signInButton: SphaerButton!
    @IBOutlet weak var forgotButton: SphaerButton!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTextFields()
        setupTextFieldsValidation()
        setupBackButton()
        //setup sign in Button
        signInButton.isEnabled = false
        
        //setup forgot Button
        forgotButton.isWhiteBackground = true
    }
    
    func setupBackButton() {
    
        backButton.setImage(R.image.icArrowBack()?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.tintColor = UIColor.sphaerDarkGrey
        
        backButton.heroModifiers = [.translate(CGPoint(x: 0, y: 150)), .fade ]
    }
    
}

//MARK: --------------------------- SphaerTextFields -----------------------------

extension LoginViewController: UITextFieldDelegate {
    
    func setupTextFields() {
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        // Do any additional setup after loading the view.
        emailTextField.keyboardType = .emailAddress
        emailTextField.returnKeyType = .next
        emailTextField.tag = 0
        
        passwordTextField.keyboardType = .default
        passwordTextField.returnKeyType = .go
        passwordTextField.isSecureTextEntry = true
        passwordTextField.tag = 1
        
        //error label password
        emailErrorLabel.font = UIFont.sphaerErrorFont()
        emailErrorLabel.textColor = UIColor.sphaerLightRed
        emailErrorLabel.text = ""
        
        //error label password
        passwordErrorLabel.font = UIFont.sphaerErrorFont()
        passwordErrorLabel.textColor = UIColor.sphaerLightRed
        passwordErrorLabel.text = ""
    }
    
    func setupTextFieldsValidation() {
    
        let emailFieldValid = emailTextField.rx.text.throttle(0.3, scheduler: MainScheduler.instance).map { self.validateEmail(string: $0) }
        
        emailFieldValid.subscribe(onNext: { isValid in
            if isValid {
                self.emailErrorLabel.text = ""
            }
        }).addDisposableTo(disposeBag)
        
        emailTextField
            .rx
            .controlEvent(UIControlEvents.editingDidEnd).asObservable().subscribe(onNext: {
                self.emailErrorLabel.text = self.validateEmail(string: self.emailTextField.text) ? "" : "Your email is incorrect"
            }).addDisposableTo(disposeBag)
        
        let passwordFieldValid = passwordTextField.rx.text.throttle(0.3, scheduler: MainScheduler.instance).map {self.validatePassword(string: $0)}
        
        passwordFieldValid.subscribe(onNext: { isValid in
            if isValid {
                self.passwordErrorLabel.text = ""
            }
        }).addDisposableTo(disposeBag)
        
        passwordTextField
            .rx
            .controlEvent(UIControlEvents.editingDidEnd).asObservable().subscribe(onNext: {
                self.passwordErrorLabel.text = self.validatePassword(string: self.passwordTextField.text) ? "" : "Password should contain at least 8 characters"
            }).addDisposableTo(disposeBag)
        
        let everythingValid = Observable.combineLatest(emailFieldValid, passwordFieldValid) {
            $0 && $1
        }
        
        everythingValid
            .bind(to: signInButton.rx.isEnabled)
            .addDisposableTo(disposeBag)
    }
    
    func validateEmail(string: String?) -> Bool {
        guard let email = string, !email.replacingOccurrences(of: " ", with: "").isEmpty else { return false }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    func validatePassword(string: String?) -> Bool {
        guard let password = string, !password.isEmpty else { return false }
        
        var isValid = true
        if password.characters.count < 8 {
            isValid = false
        }
        return isValid
    }
    
    //MARK: ---------------------- UITextFieldDelegate --------------
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            // Not found, so remove keyboard.
            textField.resignFirstResponder()
            //perform Login
        }
        return false
    }
}
