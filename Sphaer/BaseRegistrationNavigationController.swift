//
//  BaseRegistrationNavigationController.swift
//  Sphaer
//
//  Created by Dmytro Osadchyy on 7/27/17.
//  Copyright © 2017 Sphaer Oy. All rights reserved.
//

import UIKit

class BaseRegistrationController: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        //enable pop gesture with right swipe from edge
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }

    func setupNavigationBar(title: String) {
        let darkGrey = UIColor.sphaerDarkGrey
        
        navigationItem.title = title
        navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : darkGrey,
            NSFontAttributeName : UIFont.sphaerNavigationBarTitleFont() ?? UIFont.systemFont(ofSize: 22)
        ]
    }
    
    func setupNavigationBarUI() {
        
        let darkGrey = UIColor.sphaerDarkGrey

        UIApplication.shared.statusBarStyle = .lightContent
        
        navigationController?.navigationBar.tintColor = darkGrey
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
    }
    
    func setupBackButton() {
        var selector = navigationItem.backBarButtonItem?.action
        
        if selector == nil {
            selector = #selector(hero_unwindToRootViewController)
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: R.image.icArrowBack()?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: selector)
    }

}
