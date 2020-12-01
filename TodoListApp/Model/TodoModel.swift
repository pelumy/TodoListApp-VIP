//
//  TodoModel.swift
//  TodoListApp
//
//  Created by mac on 13/10/2020.
//

import Foundation
import RealmSwift

class TodoModel: Object {
    
    @objc dynamic var todoTitle = ""
    @objc dynamic var todoDescription = ""
    
    convenience init(todoTitle: String, todoDescription: String ) {
        self.init()
        self.todoTitle = todoTitle
        self.todoDescription = todoDescription
    }
    
    convenience init(todoTitle: String) {
        self.init()
        self.todoTitle = todoTitle
    }
    
}

