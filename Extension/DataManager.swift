//
//  DataManager.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/6/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import Foundation

class DataManager {
    
   class func createIcon() -> [IconModel] {
    
    return [IconModel(name: "Baby", imageName: "Baby", task: nil), IconModel(name: "Birthday", imageName: "Birthday", task: nil), IconModel(name: "Checklist", imageName: "Checklist", task: nil), IconModel(name: "Drink", imageName: "Drink", task: nil), IconModel(name: "Email", imageName: "Email", task: nil), IconModel(name: "Family", imageName: "Family", task: nil), IconModel(name: "Grocery", imageName: "Grocery", task: nil), IconModel(name: "Party", imageName: "Party", task: nil), IconModel(name: "Shopping", imageName: "Shopping", task: nil), IconModel(name: "Vacation", imageName: "Vacation", task: nil), IconModel(name: "Work", imageName: "Work", task: nil)]
    }
}
