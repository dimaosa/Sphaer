//
//  PhoneInputViewController.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 7/27/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit
import PhoneNumberKit
import RxSwift
import RxCocoa

class PhoneInputViewController: BaseRegistrationController {

    @IBOutlet weak var phoneNumberInputInfoLabel: UILabel!
    @IBOutlet weak var yourCountryPlaceholderLabel: UILabel!
    @IBOutlet weak var emojiFlagOfCountryLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    @IBOutlet weak var yourPhonePlaceholderLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var phoneTextField: PhoneNumberTextField!
    
    @IBOutlet weak var continueSphaerButton: SphaerButton!
    
    // Constains used for decrease size when keyboard appear
    @IBOutlet weak var topToInfoConstraint: NSLayoutConstraint!
    @IBOutlet weak var infoToCountryConstraint: NSLayoutConstraint!
    @IBOutlet weak var countryToPhoneConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneToButtonConstraint: NSLayoutConstraint!
    
    var setConstainsHeight: CGFloat = 30.0 {
        didSet {
            topToInfoConstraint.constant = setConstainsHeight
            infoToCountryConstraint.constant = setConstainsHeight
            countryToPhoneConstraint.constant = setConstainsHeight
            phoneToButtonConstraint.constant = setConstainsHeight
        }
    }
    private let disposeBag = DisposeBag()
    
    // Get current locale code
    var country: Variable<Country> = Variable(Country.currentCountry)
    
    var countryDriver: Driver<Country> {
        return country.asDriver()
    }
    // Phone number formatter
    let phoneNumberKit = PhoneNumberKit()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(title: "Phone Number")
        
        setupUI()
        setupLabels()
        setupKeyboard()
    }

    func setupUI() {
        phoneNumberInputInfoLabel.textColor = UIColor.sphaerWarmGrey
        yourCountryPlaceholderLabel.textColor = UIColor.sphaerDarkGrey
        
        phoneTextField.borderStyle = .none
    }
    
    func setupLabels() {
        
        phoneTextField.placeholder = "44 7859587"
        phoneTextField.defaultRegion = PhoneNumberKit.defaultRegionCode()
        
        continueSphaerButton.isEnabled = false
        
        let phoneFieldValid = phoneTextField
            .rx
            .text
            .orEmpty
            .asObservable()
            .distinctUntilChanged()
            .map { self.validate(phone: $0)}
        
        phoneFieldValid.bind(to: continueSphaerButton.rx.isEnabled).disposed(by: disposeBag)
        
        countryDriver
            .distinctUntilChanged()
            .drive(onNext: { (country) in
                self.countryCodeLabel.text = "+" + country.phoneExtension
                self.emojiFlagOfCountryLabel.text = country.emojiFlag
                self.countryNameLabel.text = country.name
        }).disposed(by: disposeBag)
    }
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: ------- Keyboard Methods --------
    
    func setupKeyboard() {
        if self.view.frame.height < 600.0 // if iPhone SE or iPod
        {
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        constraint(keyboardState: .show, notification: notification)
    }
    
    func keyboardWillHide(notification: NSNotification) {
        constraint(keyboardState: .hide, notification: notification)
    }
    
    enum KeyboardState: CGFloat {
        case show = 12.0
        case hide = 30.0
    }
    
    func constraint(keyboardState state: KeyboardState, notification: NSNotification) {
        
        let duration: TimeInterval = notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0.3
        let curve = notification.userInfo![UIKeyboardAnimationCurveUserInfoKey] as! UInt
        
        UIView.animate(withDuration: duration, delay: 0.0, options: UIViewAnimationOptions(rawValue: curve), animations: {
            self.setConstainsHeight = state.rawValue
            self.view.layoutIfNeeded()
        })
    }
    
    //MARK: -
    
    override func setupBackButton() {
        super.setupBackButton()
        
        phoneTextField.resignFirstResponder()
    }
    
    //MARK: ----- Actions -----
    
    @IBAction func selectCountryPressed(_ sender: UIButton) {
        phoneTextField.resignFirstResponder()
    }
    
    @IBAction func continuePressed(_ sender: SphaerButton) {
        phoneTextField.resignFirstResponder()
    }
    
    //MARK: ------ Private Methods -------
    
    func validate(phone: String) -> Bool {
        let fullPhoneNumber = ("+" + country.value.phoneExtension + phone).replacingOccurrences(of: " ", with: "")
        do {
            _ = try PhoneNumberKit().parse(fullPhoneNumber)
            return true
        }
        catch {
            return false
        }
    }
}
