//
//  Extension+String.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 8/23/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import Foundation

extension String {
    var shuffle: String {
        get {
            var donor = self.characters.map({ String($0) })
            var result = ""
            while donor.count > 0 {
                let index = Int(arc4random_uniform(UInt32(donor.count)))
                result += donor[index]
                donor.remove(at: index)
            }
            return result
        }
    }
}

extension Optional where Wrapped == String {
    
    var safeUnwrapp: String {
        guard let string = self else {
            return ""
        }
        return string
    }
}
