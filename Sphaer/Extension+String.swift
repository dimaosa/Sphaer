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

// String + CreditCard
//
extension String {
    
    func allCharactersAreNumbers() -> Bool {
        let nonNumberCharacterSet = NSCharacterSet.decimalDigits.inverted
        return (self.rangeOfCharacter(from: nonNumberCharacterSet) == nil)
    }
    
    func integerValueOfFirst(characters: Int) -> Int {
        guard allCharactersAreNumbers() else {
            return NSNotFound
        }
        
        if characters > self.characters.count {
            return NSNotFound
        }
        
        let indexToStopAt = self.index(self.startIndex, offsetBy: characters)
        let substring = self.substring(to: indexToStopAt)
        guard let integerValue = Int(substring) else {
            return NSNotFound
        }
        
        return integerValue
    }
    
    
    func isLuhnValid() -> Bool {
        //https://www.rosettacode.org/wiki/Luhn_test_of_credit_card_numbers
        
        guard self.allCharactersAreNumbers() else {
            //Definitely not valid.
            return false
        }
        
        let reversed = self.characters.reversed().map { String($0) }
        
        var sum = 0
        for (index, element) in reversed.enumerated() {
            guard let digit = Int(element) else {
                //This is not a number.
                return false
            }
            
            if index % 2 == 1 {
                //Even digit
                switch digit {
                case 9:
                    //Just add nine.
                    sum += 9
                default:
                    //Multiply by 2, then take the remainder when divided by 9 to get addition of digits.
                    sum += ((digit * 2) % 9)
                }
            } else {
                //Odd digit
                sum += digit
            }
        }
        
        //Valid if divisible by 10
        return sum % 10 == 0
    }
    
    func removeSpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
}



// String + ExpirationDate
//
extension String {
    
    func addSlash() -> String {
        guard self.characters.count > 2 else {
            //Nothing to add
            return self
        }
        
        let index2 = self.index(self.startIndex, offsetBy: 2)
        let firstTwo = self.substring(to: index2)
        let rest = self.substring(from: index2)
        
        return firstTwo + " / " + rest
    }
    
    func removeSlash() -> String {
        let removedSpaces = self.removeSpaces()
        return removedSpaces.replacingOccurrences(of: "/", with: "")
    }
    
    func isValidExpirationDate() -> Bool {
        let noSlash = self.removeSlash()
        guard noSlash.characters.count == 4 //Must be mmyy
            && noSlash.allCharactersAreNumbers() else { //must be all numbers
                return false
        }
        
        let index2 = self.index(self.startIndex, offsetBy: 2)
        let monthString = self.substring(to: index2)
        let yearString = "20" + self.substring(from: index2)
        
        guard
            let month = Int(monthString),
            let year = Int(yearString) else {
                //We can't even check.
                return false
        }
        
        //Month must be between january and december.
        guard (month >= 1 && month <= 12) else {
            return false
        }
        
        let now = Date()
        let currentYear = now.currentYear()
        
        guard year >= currentYear else {
            //Year is before current: Not valid.
            return false
        }
        
        if year == currentYear {
            let currentMonth = now.currentMonth()
            guard month >= currentMonth else {
                //Month is before current in current year: Not valid.
                return false
            }
        }
        
        //If we made it here: Woo!
        return true
    }
}
