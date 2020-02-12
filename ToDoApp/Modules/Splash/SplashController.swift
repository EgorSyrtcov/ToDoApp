//
//  SplashController.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/12/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class SplashController: UIViewController {
    
    override func viewDidLoad() {
        guard let viewController = UIStoryboard(name: "MainViewController",
                                                bundle: nil).instantiateInitialViewController() as? MainViewController else { return }
        viewController.presenter = MainPresenter(view: viewController)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
