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
        
        return [Task(imageName: "Family", name: "Заказать путевку"),
                Task(imageName: "Grocery", name: "Купить молоко"),
                Task(imageName: "Party", name: "Купить хлопушки"),
                Task(imageName: "Shopping", name: "Купить сметану"),
                Task( imageName: "Baby", name: "Купить памперсы =)"),
                Task(imageName: "Vacation", name: "Купить мяч"),
                Task(imageName: "Work", name: "Купить HDD"),
                Task(imageName: "Birthday", name: "Купить подарок"),
                Task(imageName: "Checklist", name: "Купить блокнот"),
                Task(imageName: "Drink", name: "Купить коньяк"),
                Task(imageName: "Email", name: "Отправить письмо")]
    }
}
