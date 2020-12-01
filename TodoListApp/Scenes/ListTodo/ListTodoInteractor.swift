//
//  ListTodoInteractor.swift
//  TodoListApp
//
//  Created by mac on 16/10/2020.
//

import Foundation

protocol ListTodosBusinessLogic {
    func listTodos(listOfTodos: [TodoModel])
    func deleteTodo(todo: TodoModel)
}

class ListTodosInteractor: ListTodosBusinessLogic {
    var todo = RealmData().arrayOfTodos
    var presenter: ListTodosPresentationLogic?
    
    func listTodos(listOfTodos: [TodoModel]) {
        let listOfTodos = RealmData().retrieveTodo() ?? [TodoModel]()
        presenter?.presentListOfTodos(listOfTodos: listOfTodos)
    }
    
    func deleteTodo(todo: TodoModel) {
        RealmData().deleteTodo(todo: todo)
        presenter?.presentRemoveTodo(todo: todo)
    }
}
