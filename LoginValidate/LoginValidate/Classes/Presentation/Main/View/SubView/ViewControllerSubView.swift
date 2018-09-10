//
//  ViewControllerSubView.swift
//  LoginValidate
//
//  Created by ken.phanith on 2018/09/08.
//  Copyright © 2018 pich. All rights reserved.
//

import Foundation
import SnapKit

class ViewControllerSubView {
    lazy var loginBtn: UIButton = {
        let btn: UIButton = UIButton()
        btn.backgroundColor = UIColor.blue
        btn.setTitle("Login", for: .normal)
        return btn
    }()
    lazy var loginText: UILabel = {
        let txt: UILabel = UILabel()
        txt.text = "Welcome To Login Page"
        return txt
    }()
    lazy var userNameInput: UITextField = {
        let userName: UITextField = UITextField()
        userName.placeholder = "Username"
        userName.layer.cornerRadius = 5.0
        userName.layer.borderWidth = 1.0
        userName.layer.borderColor = UIColor.blue.cgColor
        
        //userName.borderRect(forBounds: CGRect)
        return userName
    }()
    lazy var passInput: UITextField = {
        let pass: UITextField = UITextField()
        pass.placeholder = "Password"
        pass.layer.cornerRadius = 5.0
        pass.layer.borderWidth = 1.0
        pass.layer.borderColor = UIColor.blue.cgColor
        pass.autocapitalizationType = .none
        //show the done title instead of the defualt return key on the keyboard
        pass.returnKeyType = .done
        //indicate that this is a password field by making the following flag true
        pass.isSecureTextEntry = true
        return pass
    }()
    
    func viewControllerUpdateConstraint(){
        self.loginText.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        self.userNameInput.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(self.loginText.snp.bottom)
            make.height.equalTo(45)
            
        }
        self.passInput.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalTo(self.userNameInput.snp.bottom)
            make.height.equalTo(45)
            
        }
        self.loginBtn.snp.makeConstraints { (make) in
            make.width.equalTo(200)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-50)
        }
    }
    
}
