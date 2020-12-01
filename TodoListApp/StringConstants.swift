//
//  StringConstants.swift
//  TodoListApp
//
//  Created by mac on 13/10/2020.
//

import UIKit
enum StringConstants {
    static let listTodosScreenTitle = "Todo App"
    static let titleTextFieldPlaceholder = "Title"
    static let cellId = "cellId"
    static let addButtonTitle = "Add Todo"
    static let saveEditedTodoButtonTitle = "Save"
    static let editButtonTitle = "Edit Todo"

    static let attributedTitle = NSMutableAttributedString(
        string: "\n", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ])
    static let attributedDescripttion = NSMutableAttributedString(
        string: "", attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.regular),
            NSAttributedString.Key.foregroundColor: UIColor.black
        ])
    static let todoTitle = "Title"
    static let todoDescription = "Description"
    static let seeDetailsArrow = "chevron.right"
    static let successAlertTitle = "SUCCESS ✅"
    static let successfullyAdded = "Todo successfully added"
    static let successfullyEdited = "Todo successfully edited"
    static let ok = "OK"
    static let realmWriteError = "Could not write to database: "
    static let realmDeleteError = "Could not delete from database: "
    static let realmRetrieveError = "Could not retrieve from database: "
    static let realmSaveError = "Could not access database: "
}
