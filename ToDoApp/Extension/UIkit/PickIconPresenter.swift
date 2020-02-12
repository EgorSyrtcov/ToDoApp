//
//  PickIconPresenter.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/12/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import UIKit

class PickIconPresenter {
    
    private weak var view: PickIconViewController!
    
    let tasksModel = DataManager.createIcon()
    
    init(view: PickIconViewController) {
        self.view = view
        view.taskModel = tasksModel
    }
    
}
