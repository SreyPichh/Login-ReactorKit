//
//  LoggedInViewControllerSubView.swift
//  LoginValidate
//
//  Created by Jilay-PC on 9/11/18.
//  Copyright © 2018 pich. All rights reserved.
//

import Foundation
import SnapKit
import UIKit

class LoggedInViewControllerSubView{
    lazy var text: UILabel = {
        let txt: UILabel = UILabel()
        txt.text = "Hello World!"
//        txt.backgroundColor = UIColor.white
        return txt
    }()
    
    func loggedInUpdateConstraint() {
        self.text.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalTo(30)
            make.center.equalToSuperview()
        }
    }
}
