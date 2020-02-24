//
//  DataManager.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/24/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import Foundation

class DefaultTask {

 class func createIcon() -> [Task] {
    
    return [Task( imageName: "Baby"),
            Task(imageName: "Birthday"),
            Task(imageName: "Checklist"),
            Task(imageName: "Drink"),
            Task(imageName: "Email"),
            Task(imageName: "Family"),
            Task(imageName: "Grocery"),
            Task(imageName: "Party"),
            Task(imageName: "Shopping"),
            Task(imageName: "Vacation"),
            Task(imageName: "Work")]
    }
}
