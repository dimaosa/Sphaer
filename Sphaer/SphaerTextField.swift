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


}
