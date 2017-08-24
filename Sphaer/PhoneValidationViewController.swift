//
//  PhoneValidationViewController.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 8/23/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PhoneValidationViewController: BaseRegistrationController {

    @IBOutlet weak var phoneValidationInfoLabel: UILabel!
    
    @IBOutlet weak var enterTheCodePlaceholder: UILabel!
    
    @IBOutlet weak var codeTextField: SphaerTextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var continueButton: SphaerButton!
    
    var phoneNumber: String?
    
    var disposeBag = DisposeBag()
    
    //Constants
    let codeLength = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(title: "Phone Validation")
        setupBackButton()
        setupKeyboard()
        setupUI()
        setupTextHandling()
    }
    
    //MARK: -
    //
    func setupUI() {
    
        codeTextField.placeholder = "123456".shuffle
        codeTextField.keyboardType = .decimalPad
        codeTextField.isDigitsOnly = true
        codeTextField.maxLength = 6
        
        phoneValidationInfoLabel.text = "We have sent you an SMS with a code to the number: " + phoneNumber.safeUnwrapp
        
        //error label password
        errorLabel.isHidden = true
        errorLabel.font = UIFont.sphaerErrorFont()
        errorLabel.textColor = UIColor.sphaerLightRed
        errorLabel.text = ""
    }
    
    override func setupBackButton(){
        let backButton = UIBarButtonItem(image: R.image.icArrowBack()?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(self.dismissVC))
        self.navigationItem.setLeftBarButton(backButton, animated: false)
    }
    
    func setupTextHandling() {
        
        let codeTextFieldValid = codeTextField
            .rx
            .text
            .orEmpty
            .asObservable()
            .distinctUntilChanged()
            .map { $0.characters.count >= self.codeLength }
        
        codeTextFieldValid.bind(to: continueButton.rx.isEnabled).disposed(by: disposeBag)
        
        codeTextFieldValid.subscribe(onNext: { (valid) in
            //auto validation on the code
        }).disposed(by: disposeBag)
    }
    
    //MARK: ------- Keyboard Methods --------
    //
    enum KeyboardState {
        case showed
        case hidden
        case none
    }
    
    var keyboardState = KeyboardState.none
    
    func setupKeyboard() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    
    func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if keyboardState == .none || keyboardState == .hidden {
                constraint(notification: notification, newValue: self.view.frame.height - keyboardSize.height)
            }
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if keyboardState == .none || keyboardState == .showed {
                constraint(notification: notification, newValue: self.view.frame.height + keyboardSize.height)
            }
        }
    }
    
    func constraint(notification: NSNotification, newValue: CGFloat) {
        
        let duration: TimeInterval = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.3
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        
        UIView.animate(withDuration: duration, delay: 0.0, options: UIViewAnimationOptions(rawValue: curve), animations: {
            self.view.frame.size = CGSize(width: self.view.frame.width, height: newValue)
            self.view.layoutIfNeeded()
        })
    }
    
    //MARK: ----- Actions -----
    //
    @IBAction func continuePressed(_ sender: SphaerButton) {
        codeTextField.resignFirstResponder()
    }
    
    func dismissVC(){
        self.navigationController?.popViewController(animated: true)
    }
}
