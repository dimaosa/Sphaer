//
//  PhoneInputViewController.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 7/27/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit
import PhoneNumberKit

class PhoneInputViewController: BaseRegistrationController {

    @IBOutlet weak var phoneNumberInputInfoLabel: UILabel!
    @IBOutlet weak var yourCountryPlaceholderLabel: UILabel!
    @IBOutlet weak var emojjiFlagOfCountryLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBAction func selectCountryPressed(_ sender: UIButton) {
    }
    
    @IBOutlet weak var yourPhonePlaceholderLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var phoneTextField: PhoneNumberTextField!
    
    // Get current locale code
    //var country = Country.currentCountry
    
    // Phone number formatter
    let phoneNumberKit = PhoneNumberKit()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(title: "Phone Number")
        
        setupUI()
        setupLabels()
        
        self.phoneTextField.becomeFirstResponder()
    }

    func setupUI() {
        phoneNumberInputInfoLabel.textColor = UIColor.sphaerWarmGrey
        yourCountryPlaceholderLabel.textColor = UIColor.sphaerDarkGrey
        
        phoneTextField.borderStyle = .none
    }
    
    func setupLabels() {
        
        emojjiFlagOfCountryLabel.text = "\(Helper.emoji(countryCode: "fi"))"
        countryNameLabel.text = "Finland"
        
        phoneTextField.defaultRegion = PhoneNumberKit.defaultRegionCode()
        phoneTextField.placeholder = "44 7859587"
    }
}
