//
//  DefaultTask.swift
//  ToDoApp
//
//  Created by Egor Syrtcov on 2/12/20.
//  Copyright © 2020 Egor Syrtcov. All rights reserved.
//

import Foundation

class DefaultTask {
    
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
