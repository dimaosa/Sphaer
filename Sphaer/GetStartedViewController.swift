//
//  GetStartedViewController.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 7/26/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit

class GetStartedViewController: UIViewController {

    @IBOutlet weak var backgroundPatternImageView: UIImageView!
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var welcomeDescriptionLabel: UILabel!
    
    @IBOutlet weak var signUpButton: SphaerButton!
    
    @IBOutlet weak var alreadyHaveAccountButton: SphaerButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        welcomeLabel.font = UIFont.sphaerTutorialTitleFont()

        alreadyHaveAccountButton.isWhiteBackground = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destinationVC = segue.destination as? LoginViewController {
            destinationVC.navigationController?.isNavigationBarHidden = false
            destinationVC.navigationController?.navigationBar.tintColor = UIColor.sphaerDodgerBlue
        }
    }

}
