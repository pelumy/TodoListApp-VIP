//
//  AddTodoViewController.swift
//  TodoListApp
//
//  Created by mac on 13/10/2020.
//

import UIKit

protocol AddTodoDisplayLogic {
    func displayAddedTodo(todo: TodoModel)
}

class AddTodoViewController: UIViewController, AddTodoDisplayLogic {
    var interactor: AddTodoBusinessLogic?
    lazy var titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = StringConstants.todoTitle
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textField.setLeftPaddingPoints(10)
        textField.setRightPaddingPoints(10)
        return textField
    }()
    
    lazy var descriptionTextField: UITextView = {
        let textField = UITextView()
        textField.text = StringConstants.todoDescription
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var saveTodoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(StringConstants.addButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveNewTodo), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        layoutViews()
        
        let presenter = AddTodoPresenter()
        let interactor = AddTodoInteractor()
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .black
    }
    
    func layoutViews() {
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)
        view.addSubview(saveTodoButton)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            descriptionTextField.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 300),
            saveTodoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            saveTodoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            saveTodoButton.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 50),
            saveTodoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func displayAddedTodo(todo: TodoModel) {
        let alert = UIAlertController(title: StringConstants.successAlertTitle, message: StringConstants.successfullyAdded, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: StringConstants.ok, style: .default) { (action) -> Void in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
    
    @objc func saveNewTodo() {
        let todo = TodoModel()
        todo.todoTitle = titleTextField.text ?? ""
        todo.todoDescription = descriptionTextField.text ?? ""
        interactor?.saveNewTodo(todo: todo)
    }
}
