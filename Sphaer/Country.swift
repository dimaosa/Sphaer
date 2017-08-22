//
//  Country.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 8/22/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import Foundation

class Country: NSObject {
    
    var countryCode: String
    var phoneExtension: String
    var isMain: Bool
    
    static var emptyCountry: Country { return Country(countryCode: "", phoneExtension: "", isMain: true) }
    
    static var currentCountry: Country {
        if let countryCode = (Locale.current as NSLocale).object(forKey: NSLocale.Key.countryCode) as? String {
            return Countries.countryFromCountryCode(countryCode)
        }
        return Country.emptyCountry
    }
    
    init(countryCode: String, phoneExtension: String, isMain: Bool) {
        self.countryCode = countryCode
        self.phoneExtension = phoneExtension
        self.isMain = isMain
    }
    
    var name: String {
        return (Locale.current as NSLocale).displayName(forKey: NSLocale.Key.countryCode, value: countryCode) ?? "Invalid country code"
    }
    
    var emojiFlag: String {
        let base = UnicodeScalar("🇦").value - UnicodeScalar("A").value
        
        var string = ""
        countryCode.uppercased().unicodeScalars.forEach {
            if let scala = UnicodeScalar(base + $0.value) {
                string.append(String(describing: scala))
            }
        }
        
        return string
    }
}
