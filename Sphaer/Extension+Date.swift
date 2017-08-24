//
//  Extension+Date.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 8/25/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import Foundation

extension Date {
    
    static var gregorianCalendar: Calendar {
        get {
            return Calendar(identifier: .gregorian)
        }
    }
    
    func currentYear() -> Int {
        return Date
            .gregorianCalendar
            .component(.year, from: self)
    }
    
    func currentMonth() -> Int {
        return Date
            .gregorianCalendar
            .component(.month, from: self)
    }
}
