//
//  CreditCardViewController.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 8/24/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CreditCardViewController: BaseRegistrationController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var backCardView: UIView!
    @IBOutlet weak var cardView: UIView!
    
    // Credit Card Properties
    //
    @IBOutlet weak var cardTypeImageView: UIImageView!
    @IBOutlet weak var actionImageView: UIImageView!
    
    @IBOutlet weak var cardNumberPlaceholderLabel: UILabel!
    @IBOutlet weak var cardNumberTextField: SphaerTextField!
    
    @IBOutlet weak var expiresPlaceholderLabel: UILabel!
    @IBOutlet weak var expiresTextField: SphaerTextField!
    
    @IBOutlet weak var cvvPlaceholderLabel: UILabel!
    @IBOutlet weak var cvvTextField: SphaerTextField!
    
    @IBOutlet weak var skipThisStepButton: SphaerButton!
    @IBOutlet weak var continueButton: SphaerButton!
    
    //
    private let cardType: Variable<CardType> = Variable(.unknown)
    
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar(title: "Credit Card")
        setupUI()
        setupTextFields()
        setupCardTypeDriver()
    }
    
    func setupUI() {
        
        // Back Card UI
        backCardView.layer.cornerRadius = 10.0
        backCardView.backgroundColor = UIColor.sphaerDodgerBlue
        
        // Front Card UI
        cardView.layer.cornerRadius = 10.0
        cardView.backgroundColor = UIColor.sphaerDodgerBlue
        cardView.layer.masksToBounds = false
        cardView.layer.shadowOpacity = 0.15
        cardView.layer.shadowRadius = 20.0
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10.0)
        cardView.layer.shadowColor = UIColor.sphaerBlack.cgColor
        
        // Card Number
        cardNumberPlaceholderLabel.text = "Card Number".uppercased()
        cardNumberPlaceholderLabel.textColor = UIColor.sphaerDarkGrey
        
        cardNumberTextField.placeholder = "xxxx xxxx xxxx xxxx".uppercased()
        cardNumberTextField.tintColor = UIColor.sphaerWhite
        cardNumberTextField.textColor = UIColor.sphaerDarkGreyBlue
        cardNumberTextField.isDigitsOnly = true
        cardNumberTextField.keyboardType = .decimalPad
        
        // Expires
        expiresPlaceholderLabel.text = "Expires".uppercased()
        expiresPlaceholderLabel.textColor = UIColor.sphaerDarkGrey
        
        expiresTextField.textColor = UIColor.sphaerDarkGreyBlue
        expiresTextField.keyboardType = .decimalPad
        expiresTextField.tintColor = UIColor.sphaerWhite
        //expiresTextField.isDigitsOnly = true
        
        // CCV
        cvvPlaceholderLabel.text = "cvv".uppercased()
        cvvPlaceholderLabel.textColor = UIColor.sphaerDarkGrey
        
        cvvTextField.textColor = UIColor.sphaerDarkGreyBlue
        cvvTextField.keyboardType = .decimalPad
        cvvTextField.tintColor = UIColor.sphaerWhite
        cvvTextField.isDigitsOnly = true
        
        // Skip this step Button
        skipThisStepButton.isWhiteBackground = true
    }
    
    func setupCardTypeDriver() {
        cardType
            .asDriver()
            .drive(onNext: {
                cardType in
                self.cardTypeImageView.image = cardType.image
                
                // Update MaxLength for CVV Text Field
                self.cvvTextField.maxLength = cardType.cvvDigits
                if cardType.cvvDigits == 4 {
                    self.cvvTextField.placeholder = "1234"
                } else {
                    self.cvvTextField.placeholder = "123"
                }
            })
            .disposed(by: disposeBag)
    }
    
    func setupTextFields() {
        
        let cardNumberValid = cardNumberTextField
            .rx
            .text
            .map{ self.validate(cardText: $0) }
        
//        cardNumberValid
//            .bind
//            .subscribe(onNext: { self.creditCardNumberTextField.valid = $0 })
//            .addDisposableTo(disposeBag)
        
        let expirationValid = expiresTextField
            .rx
            .text
            .map { self.validate(expirationDateText: $0) }
        
//        expirationValid
//            .subscribe(onNext: { self.expirationDateTextField.valid = $0 })
//            .dispose(by: disposeBag)
        
        let cvvValid = cvvTextField
            .rx
            .text
            .map { self.validate(cvvText: $0) }
        
//        cvvValid
//            .subscribe(onNext: { self.cvvTextField.valid = $0 })
//            .dispose(by: disposeBag)
        
        let everythingValid = Observable
            .combineLatest(cardNumberValid, expirationValid, cvvValid) {
                $0 && $1 && $2 //All must be true
        }
        
        everythingValid
            .bind(to: continueButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    //MARK: - Validation methods
    
    func validate(cardText: String?) -> Bool {
        guard let cardTextSafe = cardText else { return false }
        
        let noWhitespace = cardTextSafe.removeSpaces()
        
        updateCardType(using: noWhitespace)
        formatCardNumber(using: noWhitespace)
        advanceIfNecessary(noSpacesCardNumber: noWhitespace)
        
        guard cardType.value != .unknown else {
            //Definitely not valid if the type is unknown.
            return false
        }
        
        guard noWhitespace.isLuhnValid() else {
            //Failed luhn validation
            return false
        }
        
        return noWhitespace.characters.count == self.cardType.value.expectedDigits
    }
    
    func validate(expirationDateText expiration: String?) -> Bool {
        guard let expirationSafe = expiration else { return false }

        let strippedSlashExpiration = expirationSafe.removeSlash()
        
        formatExpirationDate(using: strippedSlashExpiration)
        advanceIfNecessary(expirationNoSpacesOrSlash: strippedSlashExpiration)
        
        return strippedSlashExpiration.isValidExpirationDate()
    }
    
    func validate(cvvText cvv: String?) -> Bool {
        guard let cvvSafe = cvv, cvvSafe.allCharactersAreNumbers() else { return false }
        
        return cvvSafe.characters.count == self.cardType.value.cvvDigits
    }
    
    //MARK: Single-serve helper functions
    
    private func updateCardType(using noSpacesNumber: String) {
        cardType.value = CardType.fromString(string: noSpacesNumber)
    }
    
    private func formatCardNumber(using noSpacesCardNumber: String) {
        cardNumberTextField.text = self.cardType.value.format(noSpaces: noSpacesCardNumber)
    }
    
    func advanceIfNecessary(noSpacesCardNumber: String) {
        if noSpacesCardNumber.characters.count == self.cardType.value.expectedDigits {
            expiresTextField.becomeFirstResponder()
        }
    }
    
    func formatExpirationDate(using expirationNoSpacesOrSlash: String) {
        expiresTextField.text = expirationNoSpacesOrSlash.addSlash()
    }
    
    func advanceIfNecessary(expirationNoSpacesOrSlash: String) {
        if expirationNoSpacesOrSlash.characters.count == 4 { //mmyy
            self.cvvTextField.becomeFirstResponder()
        }
    }
}
