//
//  ListTodosPresenter.swift
//  TodoListApp
//
//  Created by mac on 16/10/2020.
//

import Foundation

protocol ListTodosPresentationLogic {
    func presentListOfTodos(listOfTodos: [TodoModel])
    func presentRemoveTodo(todo: TodoModel)
}

class ListTodosPresenter: ListTodosPresentationLogic {
    var view: ListTodosDisplayLogic?
    func presentListOfTodos(listOfTodos: [TodoModel]) {
        view?.displayListOfTodos(listOfTodos: listOfTodos)
    }
    
    func presentRemoveTodo(todo: TodoModel) {
        view?.displayRemovedTodo(todo: todo)
    }
}
