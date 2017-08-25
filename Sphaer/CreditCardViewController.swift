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
        cardNumberTextField.font = UIFont.sphaerInputCardFont()
        cardNumberTextField.letterSpacing = 1.2
        cardNumberTextField.maxLength = 19 
        
        // Expires
        expiresPlaceholderLabel.text = "Expires".uppercased()
        expiresPlaceholderLabel.textColor = UIColor.sphaerDarkGrey
        
        expiresTextField.placeholder = "MM / YY"
        expiresTextField.textColor = UIColor.sphaerDarkGreyBlue
        expiresTextField.keyboardType = .decimalPad
        expiresTextField.tintColor = UIColor.sphaerWhite
        expiresTextField.isDigitsOnly = true
        expiresTextField.font = UIFont.sphaerInputCardFont()
        expiresTextField.letterSpacing = 1.2
        expiresTextField.maxLength = 7 // Because "MM / YY".charactest.count = 7
        
        // CCV
        cvvPlaceholderLabel.text = "cvv".uppercased()
        cvvPlaceholderLabel.textColor = UIColor.sphaerDarkGrey
        
        cvvTextField.textColor = UIColor.sphaerDarkGreyBlue
        cvvTextField.keyboardType = .decimalPad
        cvvTextField.tintColor = UIColor.sphaerWhite
        cvvTextField.isDigitsOnly = true
        cvvTextField.font = UIFont.sphaerInputCardFont()
        cvvTextField.letterSpacing = 1.2
        
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
            }).disposed(by: disposeBag)
    }
    
    func setupTextFields() {
        
        let cardNumberValid = cardNumberTextField
            .rx
            .text
            .map{ self.validate(cardText: $0) }
        
        cardNumberTextField
            .rx
            .controlEvent(.editingChanged)
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                
                guard let strong = self, let string = strong.cardNumberTextField.text else { return }
                
                // Set CardType
                strong.cardType.value = strong.cardType(using: strong.cardNumberTextField.text ?? "")

                // Remember the position of cursor in order to put it back when textField will be formatted
                let oldPositionIndex = strong.textFieldCursorPosition(textField: strong.cardNumberTextField)
                
                let formatted = strong.formattedCardNumber(using: string)
                strong.cardNumberTextField.text = formatted.text
                
                // Change position of cursor when there is extra space"s" added
                guard let position = strong.textPosition(from: strong.cardNumberTextField, offset: oldPositionIndex + formatted.amountOfSpacesAdded) else { return }
                strong.cardNumberTextField.selectedTextRange = strong.cardNumberTextField.textRange(from: position, to: position)
                
                // Advance to next field if needed
                if formatted.text.removeSpaces().characters.count == strong.cardType.value.expectedDigits && strong.cardNumberTextField.endOfDocument == position {
                    strong.expiresTextField.becomeFirstResponder()
                }
            }).disposed(by: disposeBag)
        
        let expirationValid = expiresTextField
            .rx
            .text
            .map { self.validate(expirationDateText: $0) }
        
        expiresTextField
            .rx
            .controlEvent(.editingChanged)
            .asObservable()
            .subscribe(onNext: { [weak self] _ in
                
                guard let strong = self, let text = strong.expiresTextField.text else { return }
                
                // Remember the position of cursor in order to put it back when textField will be formatted
                let oldPositionIndex = strong.textFieldCursorPosition(textField: strong.expiresTextField)
                
                let formatted = strong.formatExpirationDate(using: text)
                strong.expiresTextField.text = formatted.text
                
                // Change position of cursor when there is extra space"s" added
                guard let position = strong.textPosition(from: strong.expiresTextField, offset: oldPositionIndex + formatted.amountOfSpacesAdded) else { return }
                strong.expiresTextField.selectedTextRange = strong.expiresTextField.textRange(from: position, to: position)
                
                // Advance to next field if needed
                if formatted.text.removeSlash().characters.count == strong.cardType.value.expectedDigitsInExperation && strong.expiresTextField.endOfDocument == position {
                    strong.cvvTextField.becomeFirstResponder()
                }
        }).disposed(by: disposeBag)
        
        let cvvValid = cvvTextField
            .rx
            .text
            .map { self.validate(cvvText: $0) }
        
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
        guard
            let noWhitespace = cardText?.removeSpaces(),
            cardType(using: noWhitespace) != .unknown || noWhitespace.isLuhnValid()
        else {
            return false
        }
        
        return noWhitespace.characters.count == self.cardType.value.expectedDigits
    }
    
    
    func validate(expirationDateText expiration: String?) -> Bool {
        guard let expirationSafe = expiration?.removeSlash() else { return false }
        return expirationSafe.isValidExpirationDate()
    }
    
    func validate(cvvText cvv: String?) -> Bool {
        guard let cvvSafe = cvv else { return false }
        return cvvSafe.characters.count == self.cardType.value.cvvDigits
    }
    
    //MARK: Single-serve helper functions
    
    private func cardType(using noSpacesNumber: String) -> CardType {
        return CardType.fromString(string: noSpacesNumber)
    }
    
    private func formattedCardNumber(using cardNumber: String) -> (text: String, amountOfSpacesAdded: Int) {
        
        let formatted = self.cardType.value.format(noSpaces: cardNumber.removeSpaces())
        
        let amountOfSpacesAdded = formatted.characters.count - cardNumber.characters.count
        
        return (formatted, amountOfSpacesAdded > 0 ? amountOfSpacesAdded : 0)
    }
    
    func formatExpirationDate(using expirationDate: String) -> (text: String, amountOfSpacesAdded: Int) {
        
        //In order to make it clear as a child and pure as a Canadian Nature
        let expirationNoSpacesOrSlash = expirationDate.removeSlash() // It also removes spaces
        
        let formatted = expirationNoSpacesOrSlash.addSlash()
        
        let amountOfSpacesAdded = formatted.characters.count - expirationDate.characters.count
        
        return (formatted, amountOfSpacesAdded > 0 ? amountOfSpacesAdded : 0)
    }
    
    func textFieldCursorPosition(textField: UITextField) -> Int {
        if let selectedRange = textField.selectedTextRange {
            return textField.offset(from: textField.beginningOfDocument, to: selectedRange.start)
        }
        return 0
    }
    
    func textPosition(from textField: UITextField, offset: Int) -> UITextPosition? {
        return textField.position(from: textField.beginningOfDocument, offset: offset)
    }
}
