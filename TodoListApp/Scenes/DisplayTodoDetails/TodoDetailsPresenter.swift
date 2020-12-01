//
//  TodoDetailsPresenter.swift
//  TodoListApp
//
//  Created by mac on 16/10/2020.
//

import Foundation

protocol TodoDetailsPresentationLogic {
    func presentUpdatedTodo(todo: TodoModel)
}

class TodoDetailsPresenter: TodoDetailsPresentationLogic {
    var view: TodoDetailsDisplayLogic?
    func presentUpdatedTodo(todo: TodoModel) {
        view?.displayUpdatedTodo(todo: todo)
    }
}
