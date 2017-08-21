//
//  BaseRegistrationNavigationController.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 7/27/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit

class BaseRegistrationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackButton()
    }

    func setupNavigationBar(title: String) {
        let darkGrey = UIColor.sphaerDarkGrey
        
        UIApplication.shared.statusBarStyle = .lightContent
        
        navigationController?.navigationBar.tintColor = darkGrey
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        navigationItem.title = title
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : UIColor.darkGray,
            NSFontAttributeName : UIFont.sphaerNavigationBarTitleFont() ?? UIFont.systemFont(ofSize: 26)
        ]
        
        if let bounds = navigationController?.navigationBar.bounds {
            navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height + 14.0)
        }
    }
    
    func setupBackButton() {
        var selector = navigationItem.leftBarButtonItem?.action
        
        if selector == nil {
            selector = #selector(hero_unwindToRootViewController)
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.icArrowBack()?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: selector)
    }

}
