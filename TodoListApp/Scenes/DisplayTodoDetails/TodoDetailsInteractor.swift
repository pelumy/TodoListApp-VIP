//
//  TodoDetailsInteractor.swift
//  TodoListApp
//
//  Created by mac on 16/10/2020.
//

import Foundation

protocol TodoDetailsBusinessLogic {
    func editTodo(todo: TodoModel, todoTitle: String, todoDescription: String)
}

class TodoDetailsInteractor: TodoDetailsBusinessLogic {
    var presenter: TodoDetailsPresentationLogic?
    
    func editTodo(todo: TodoModel, todoTitle: String, todoDescription: String) {
        RealmData().write { _ in
            todo.todoTitle = todoTitle
            todo.todoDescription = todoDescription
        }
        presenter?.presentUpdatedTodo(todo: todo)
    }
}
