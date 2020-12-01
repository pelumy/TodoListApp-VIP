//
//  AddTodoPresentationLogic.swift
//  TodoListApp
//
//  Created by mac on 14/10/2020.
//

import Foundation

protocol AddTodoPresentationLogic {
    func presentAddedTodo(todo: TodoModel)
}

class AddTodoPresenter: AddTodoPresentationLogic {
    var view: AddTodoDisplayLogic?
    
    func presentAddedTodo(todo: TodoModel) {
        view?.displayAddedTodo(todo: todo)
    }
}
