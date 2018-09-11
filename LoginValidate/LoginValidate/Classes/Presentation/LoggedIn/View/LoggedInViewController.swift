//
//  LoggedInViewController.swift
//  LoginValidate
//
//  Created by Jilay-PC on 9/11/18.
//  Copyright © 2018 pich. All rights reserved.
//

import Foundation
import UIKit

class LoggedInViewController: UIViewController {
    private var subView: LoggedInViewControllerSubView = LoggedInViewControllerSubView()
    
}
extension LoggedInViewController{
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.subView.text)
    }
    
    override func viewDidLayoutSubviews() {
        self.subView.loggedInUpdateConstraint()
    }
}
