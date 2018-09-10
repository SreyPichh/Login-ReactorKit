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
    }
    enum Mutation {
        case inputUserName(String)
        case inputPass(String)
    }
    
    var initialState: ViewControllerReactor.State
    
    struct State {
        var uname: String
        var pass: String
    }
    
    init() {
        initialState = State(uname: "", pass: "")
    }
    
    func mutate(action: ViewControllerReactor.Action) -> Observable<ViewControllerReactor.Mutation> {
        switch action {
        case .inputUserName(let uname):
            return Observable.just(Mutation.inputUserName(uname))
        case .inputPass(let pass):
            return Observable.just(Mutation.inputPass(pass))
        }
    }
    func reduce(state: ViewControllerReactor.State, mutation: ViewControllerReactor.Mutation) -> ViewControllerReactor.State {
        var newState = state
        switch mutation {
        case .inputUserName(let uname):
            newState.uname = uname
        case .inputPass(let pass):
            newState.pass = pass
        }
        return newState
    }
    
}
