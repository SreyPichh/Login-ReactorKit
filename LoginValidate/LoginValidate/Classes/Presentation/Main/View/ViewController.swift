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

}
extension ViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.addSubview(self.subView.loginText)
        self.view.addSubview(self.subView.userNameInput)
        self.view.addSubview(self.subView.passInput)
        self.view.addSubview(self.subView.loginBtn)
    }
    
    override func viewDidLayoutSubviews() {
        self.subView.viewControllerUpdateConstraint()
    }
}

extension ViewController: StoryboardView{
    func bind(reactor: ViewControllerReactor) {
        self.subView.userNameInput.rx.text
            .map{Reactor.Action.inputUserName($0!)}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        self.subView.passInput.rx.text
            .map{Reactor.Action.inputPass($0!)}
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
    }
}

