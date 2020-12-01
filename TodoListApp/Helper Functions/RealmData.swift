//
//  DatabaseManager.swift
//  TodoListApp
//
//  Created by mac on 13/10/2020.
//

import Foundation
import RealmSwift

public class RealmData {
    var arrayOfTodos: Array<TodoModel>?
    
    func saveTodo(todo: TodoModel) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(todo)
            }
        }
        catch {
            print (StringConstants.realmSaveError, error)
        }
    }
    
    func retrieveTodo() -> Array<TodoModel>? {
        
        do {
            let realm = try Realm()
            let todo = TodoModel.self
            arrayOfTodos = Array(realm.objects(todo))
        }
        catch {
            print (StringConstants.realmRetrieveError, error)
        }
        return arrayOfTodos
    }
    
    func write(todoToUpdate: (_ todo: TodoModel) -> ()) {
        do {
            let realm = try Realm()
            try realm.write {
                todoToUpdate(TodoModel())
            }
        } catch {
            print (StringConstants.realmWriteError, error)
        }
    }
    
    func deleteTodo(todo: TodoModel) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(todo)
            }
        }
        catch {
            print (StringConstants.realmDeleteError, error)
        }
    }
}

