//
//  SphaerButton.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 7/26/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit

class SphaerButton: UIButton {
    
    var isWhiteBackground = false {
        didSet {
            if isWhiteBackground {
                backgroundColor = UIColor.clear
                tintColor = UIColor.sphaerDodgerBlue
                layer.shadowColor = UIColor.clear.cgColor
            }
        }
    }
    
    var shadowColor: CGColor {
        return UIColor.sphaerDodgerBlue41.cgColor
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = UIColor.sphaerDodgerBlue
        
        tintColor = UIColor.sphaerPaleGrey
        
        contentMode = .scaleAspectFit
        contentHorizontalAlignment = .center
        contentVerticalAlignment = .center
        
        layer.cornerRadius = 7.0
        
        //prevent clipsToBounds clip shadow
        layer.masksToBounds = false
        
        layer.shadowOpacity = 1.0
        layer.shadowRadius = 10.0
        layer.shadowOffset = CGSize(width: 0, height: 10.0)
        layer.shadowColor = shadowColor
        
        imageEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        
        addTarget(self, action: #selector(self.pushButton), for: .touchDown)
        addTarget(self, action: #selector(self.releaseButton), for: .touchDragOutside)
        addTarget(self, action: #selector(self.releaseButton), for: .touchUpInside)
        
    }
    
    func pushButton() {
        
    }
    
    func releaseButton() {
        
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                if isWhiteBackground {
                    tintColor = UIColor.sphaerDodgerBlue
                    layer.shadowColor = UIColor.clear.cgColor
                    backgroundColor = UIColor.clear
                } else {
                    tintColor = UIColor.sphaerPaleGrey
                    layer.shadowColor = shadowColor
                    backgroundColor = UIColor.sphaerDodgerBlue
                }
            } else {
                if isWhiteBackground {
                    tintColor = UIColor.sphaerGreyish
                } else {
                    tintColor = UIColor.sphaerWhite
                    layer.shadowColor = UIColor.clear.cgColor
                    backgroundColor = UIColor.sphaerWhiteThree
                }
            }
        }
    }
}
