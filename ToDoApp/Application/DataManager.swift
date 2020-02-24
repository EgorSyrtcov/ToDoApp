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
    
    class func createTask() -> [Task] {
        
        return [Task(imageName: "Family", name: "Заказать путевку", completed: false),
                Task(imageName: "Grocery", name: "Купить молоко", completed: false),
                Task(imageName: "Party", name: "Купить хлопушки", completed: false),
                Task(imageName: "Shopping", name: "Купить сметану", completed: true),
                Task( imageName: "Baby", name: "Купить памперсы =)", completed: false),
                Task(imageName: "Vacation", name: "Купить мяч", completed: false),
                Task(imageName: "Work", name: "Купить SSD", completed: false)]
    }
}
