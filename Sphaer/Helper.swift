//
//  Helpers.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 8/22/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import Foundation

class Helper {
    
    class func emoji(countryCode: String) -> Character {
        let base = UnicodeScalar("🇦").value - UnicodeScalar("A").value
        
        var string = ""
        countryCode.uppercased().unicodeScalars.forEach {
            if let scala = UnicodeScalar(base + $0.value) {
                string.append(String(describing: scala))
            }
        }
        
        return Character(string)
    }
}
