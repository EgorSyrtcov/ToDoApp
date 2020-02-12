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
    
    return [Task( imageName: "Baby", name: nil), Task(imageName: "Birthday", name: nil),
            Task(imageName: "Checklist", name: nil), Task(imageName: "Drink", name: nil),
            Task(imageName: "Email", name: nil), Task(imageName: "Family", name: nil),
            Task(imageName: "Grocery", name: nil), Task(imageName: "Party", name: nil),
            Task(imageName: "Shopping", name: nil), Task(imageName: "Vacation", name: nil),
            Task(imageName: "Work", name: nil)]
    }
}
