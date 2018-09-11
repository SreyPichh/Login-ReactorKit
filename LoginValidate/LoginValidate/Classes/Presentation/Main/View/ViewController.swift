//
//  ViewController.swift
//  LoginValidate
//
//  Created by ken.phanith on 2018/09/08.
//  Copyright © 2018 pich. All rights reserved.
//

import UIKit
import ReactorKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {
    var subView: ViewControllerSubView = ViewControllerSubView()
    var disposeBag: DisposeBag = DisposeBag()
    
    var router: ViewControllerRouter?

}
extension ViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.router = ViewControllerRouter(viewController: self)
//        self.subView.userNameInput.text = "pich"
//        self.subView.passInput.text = "pich123"
//
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.subView.loginText)
        self.view.addSubview(self.subView.userNameInput)
        self.view.addSubview(self.subView.passInput)
        self.view.addSubview(self.subView.loginBtn)
        self.view.addSubview(self.subView.unameErrorMsg)
        self.view.addSubview(self.subView.passError)
        
        self.reactor = ViewControllerReactor(router: self.router!)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        self.subView.viewControllerUpdateConstraint()
    }
}

extension ViewController: StoryboardView{
    func bind(reactor: ViewControllerReactor) {
        self.subView.userNameInput.rx.text
            .filter { ($0?.count)! > 0 }
            .map{Reactor.Action.inputUserName($0!)}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.subView.passInput.rx.text
            .filter {($0?.count)! > 0}
            .map{Reactor.Action.inputPass($0!)}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        self.subView.loginBtn.rx.tap
            .map { Reactor.Action.login }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.reactor?.state
            .map{$0.unameValidate}
            .bind(to: self.subView.unameErrorMsg.rx.text)
            .disposed(by: self.disposeBag)
        self.reactor?.state
            .map{$0.passValidate}
            .bind(to: self.subView.passError.rx.text)
            .disposed(by: disposeBag)
    }
}

