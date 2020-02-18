//
//  IconModel.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import Foundation

class Task {
    
//    var id: String
    var imageName: String
    var name: String?
    var completed: Bool
    
    init(imageName: String, name: String?, completed: Bool) {
        self.imageName = imageName
        self.name = name
        self.completed = completed
    }
}
