//
//  DataManager.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import Foundation

class DataManager {
    
   class func createIcon() -> [Task] {
    
    return [Task( imageName: "Baby", name: nil, completed: false),
            Task(imageName: "Birthday", name: nil, completed: false),
            Task(imageName: "Checklist", name: nil, completed: false),
            Task(imageName: "Drink", name: nil, completed: false),
            Task(imageName: "Email", name: nil, completed: false),
            Task(imageName: "Family", name: nil, completed: true),
            Task(imageName: "Grocery", name: nil, completed: false),
            Task(imageName: "Party", name: nil, completed: false),
            Task(imageName: "Shopping", name: nil, completed: false),
            Task(imageName: "Vacation", name: nil, completed: false),
            Task(imageName: "Work", name: nil, completed: false)]
    }
}
