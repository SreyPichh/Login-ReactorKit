//
//  ViewControllerRouter.swift
//  LoginValidate
//
//  Created by Jilay-PC on 9/11/18.
//  Copyright © 2018 pich. All rights reserved.
//

import Foundation

final class ViewControllerRouter {
    
    weak var viewController: ViewController?
    
    init(viewController: ViewController) {
        self.viewController = viewController
    }
    
    func navigateToLoggedIn() -> Void {
        self.viewController?.present(LoggedInViewController(), animated: true, completion: nil)
    }
    
}
