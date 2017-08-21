//
//  Extension+UIFont.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 7/26/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit

extension UIFont {
    
    class func sphaerTutorialTitleFont() -> UIFont? {
        return UIFont(name: "SanFranciscoDisplay-Bold", size: 34.0)
    }
    
    class func sphaerTextStyleFont() -> UIFont? {
        return UIFont(name: "SanFranciscoDisplay-Bold", size: 34.0)
    }
    
    class func sphaerNavigationBarTitleFont() -> UIFont? {
        return UIFont(name: "SanFranciscoDisplay-Medium", size: 26.0)
    }
    
    class func sphaerFlagsFont() -> UIFont? {
        return UIFont(name: "AppleColorEmoji", size: 25.0)
    }
    
    class func sphaerInputDefaultFont() -> UIFont? {
        return UIFont(name: "SanFranciscoDisplay-Regular", size: 24.0)
    }
    
    class func sphaerInputFilledFont() -> UIFont? {
        return UIFont(name: "SanFranciscoDisplay-Regular", size: 24.0)
    }
    
    class func sphaerTutorialSubTitleFont() -> UIFont? {
        return UIFont(name: "SanFranciscoText-Regular", size: 20.0)
    }
    
    class func sphaerInputCardFont() -> UIFont? {
        return UIFont(name: "SanFranciscoDisplay-Regular", size: 18.0)
    }
    
    class func sphaerButtonInvisibleFont() -> UIFont? {
        return UIFont(name: "SanFranciscoText-Regular", size: 17.0)
    }
    
    class func sphaerButtonDefaultFont() -> UIFont? {
        return UIFont(name: "SanFranciscoText-Regular", size: 17.0)
    }
    
    class func sphaerCRegular15Font() -> UIFont {
        return UIFont.systemFont(ofSize: 15.0, weight: UIFontWeightRegular)
    }
    
    class func sphaerErrorFont() -> UIFont? {
        return UIFont(name: "SanFranciscoDisplay-Regular", size: 12.0)
    }
}
