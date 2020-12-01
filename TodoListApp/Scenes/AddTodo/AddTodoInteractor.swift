//
//  AddTodoBusinessLogic.swift
//  TodoListApp
//
//  Created by mac on 13/10/2020.
//

import UIKit

protocol AddTodoBusinessLogic {
    func saveNewTodo(todo: TodoModel)
}

class AddTodoInteractor: AddTodoBusinessLogic{
    var presenter: AddTodoPresentationLogic?
    
    func saveNewTodo(todo: TodoModel) {
        RealmData().saveTodo(todo: todo)
        presenter?.presentAddedTodo(todo: todo)
    }
}
