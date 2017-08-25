//
//  SphaerTextField.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 7/26/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit

class SphaerTextField: UITextField, UITextFieldDelegate {

    @IBInspectable var isPasteEnabled: Bool = true
    @IBInspectable var insetX: CGFloat = 0.0
    @IBInspectable var insetY: CGFloat = 0.0
    @IBInspectable var isDigitsOnly: Bool = false
    @IBInspectable var maxLength: Int = 1000
    
    var letterSpacing: CGFloat = 1.3
    
    override var text: String? {
        didSet {
            if let textString = text, textString.characters.count > 0 {
                let attrString = NSMutableAttributedString(string: textString)
                attrString.addAttribute(NSKernAttributeName, value: letterSpacing, range: NSRange(location: 0, length: attrString.length - 1))
                attributedText = attrString
            }
        }
    }
    
    override var placeholder: String? {
        didSet {
            if let textString = placeholder, textString.characters.count > 0 {
                let attributedString = NSMutableAttributedString(string: textString)
                attributedString.addAttribute(NSKernAttributeName, value: letterSpacing, range: NSRange(location: 0, length: attributedString.length - 1))
                attributedPlaceholder = attributedString
            }
        }
    }
        
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        
        if action == #selector(UIResponderStandardEditActions.paste(_:)) {
            return isPasteEnabled
        }
        return super.canPerformAction(action, withSender: sender)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        delegate = self
        self.borderStyle = .none
        self.backgroundColor = UIColor.clear
        
        self.font = UIFont.sphaerInputDefaultFont()
        self.textColor = UIColor.sphaerBlack
        self.spellCheckingType = .no
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
    }
    
    deinit {
        delegate = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }
    
    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: insetX, dy: insetY)
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var result = true
        
        if isDigitsOnly {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            result = allowedCharacters.isSuperset(of: characterSet)
        }
        let count = self.text?.characters.count ?? range.location
        if count >= maxLength && !string.isEmpty {
            result = false

        }
        
        return result
    }

}
