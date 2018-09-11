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
    let login_url = "https://qiita.com/phansreypich/items/9f2360b485929d2d5639"
    lazy var loginBtn: UIButton = {
        let btn: UIButton = UIButton()
        btn.backgroundColor = UIColor.blue
        btn.layer.cornerRadius = 5.0
        btn.setTitle("Login", for: .normal)
        return btn
    }()
    lazy var loginText: UILabel = {
        let txt: UILabel = UILabel()
        txt.text = "Login"
        return txt
    }()
    lazy var userNameInput: UITextField = {
        let userName: UITextField = UITextField()
        userName.placeholder = "Username"
        userName.layer.cornerRadius = 5.0
        userName.layer.borderWidth = 1.0
        userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        userName.layer.borderColor = UIColor.gray.cgColor
        
        //userName.borderRect(forBounds: CGRect)
        return userName
    }()
    lazy var unameErrorMsg: UILabel = {
        let error: UILabel = UILabel()
        error.textColor = UIColor.red
        return error
    }()
    lazy var passInput: UITextField = {
        let pass: UITextField = UITextField()
        pass.placeholder = "Password"
        pass.layer.cornerRadius = 5.0
        pass.layer.borderWidth = 1.0
        pass.layer.borderColor = UIColor.gray.cgColor
        pass.autocapitalizationType = .none
        //show the done title instead of the defualt return key on the keyboard
        pass.returnKeyType = .done
        //indicate that this is a password field by making the following flag true
        pass.isSecureTextEntry = true
        return pass
    }()
    lazy var passError: UILabel = {
        let pwdError: UILabel = UILabel()
        pwdError.textColor = UIColor.red
        return pwdError
    }()
    
    func viewControllerUpdateConstraint(){
        self.loginText.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        self.userNameInput.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.top.equalTo(self.loginText.snp.bottom).offset(50)
            make.height.equalTo(45)
            
        }
        self.passInput.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.top.equalTo(self.userNameInput.snp.bottom).offset(30)
            make.height.equalTo(45)
            
        }
        self.loginBtn.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(300)
        }
        self.passError.snp.makeConstraints { (make) in
            make.width.equalTo(350)
            make.height.equalTo(30)
            make.top.equalTo(self.passInput.snp.bottom)
            make.centerX.equalToSuperview()
        }
        self.unameErrorMsg.snp.makeConstraints { (make) in
            make.width.equalTo(350)
            make.height.equalTo(30)
            make.top.equalTo(self.userNameInput.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
}
