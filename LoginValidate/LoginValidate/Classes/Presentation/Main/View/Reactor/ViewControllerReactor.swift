//
//  ViewControllerReactor.swift
//  LoginValidate
//
//  Created by Jilay-PC on 9/10/18.
//  Copyright © 2018 pich. All rights reserved.
//

import Foundation
import ReactorKit
import RxSwift
import RxCocoa

class ViewControllerReactor: Reactor {
    enum Action {
        case inputUserName(String)
        case inputPass(String)
        case login
    }
    enum Mutation {
        case inputUserName(String)
        case inputPass(String)
        case inputUserNameValidate(String)
        case inputPassValidate(String)
    }
    
    var initialState: ViewControllerReactor.State
    
    struct State {
        var uname: String
        var pass: String
        var unameValidate: String
        var passValidate: String
    }
    
    var router: ViewControllerRouter
    
    init(router: ViewControllerRouter) {
        self.router = router
        initialState = State(uname: "", pass: "", unameValidate: "", passValidate: "")
    }
    
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
        case .inputUserName(let uname):
            // validation code
            var msg: String = ""
            if self.isUnameValidate(uname: uname){
                msg = ""
            }
            else{
                msg = "Input a valid User Name!"
            }
            return Observable.concat([Observable.just(Mutation.inputUserName(uname)),
                                      Observable.just(Mutation.inputUserNameValidate(msg))])
        case .inputPass(let pass):
//          validation code here
            var msg: String = ""
            if self.isPassValidate(pass: pass){
                msg = ""
            }
            else{
                msg = "Input a valid password!"
            }
            return Observable.concat([Observable.just(Mutation.inputPass(pass)),
                                      Observable.just(Mutation.inputPassValidate(msg))])
        case .login:
//            self.router.navigateToLoggedIn()
            // your validation logic here
//            self.currentState.uname
//            self.currentState.pass
            if isPassValidate(pass: self.currentState.pass) && isUnameValidate(uname: self.currentState.uname){
                self.router.navigateToLoggedIn()
            }
            return Observable.empty()
        }
    }
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        var newState = state
        switch mutation {
        case .inputUserName(let uname):
            newState.uname = uname
        case .inputPass(let pass):
            newState.pass = pass
        case .inputUserNameValidate(let unameValidate):
            newState.unameValidate = unameValidate
        case .inputPassValidate(let passValidate):
            newState.passValidate = passValidate
        }
        
        return newState
        
    }
    
    func isUnameValidate(uname: String) -> Bool {
        let RegEx  = "\\w{7,18}"
        let Test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return Test.evaluate(with: uname)
    }
    func isPassValidate(pass: String) -> Bool {
        let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: pass)
    }
    
}
