//
//  ViewController.swift
//  TodoListApp
//
//  Created by mac on 13/10/2020.
//

import UIKit

protocol TodoDetailsDisplayLogic {
    func  displayUpdatedTodo(todo: TodoModel)
}

class TodoDetailsViewController: UIViewController {
    var updatedTodo:  TodoModel?
    var interactor: TodoDetailsInteractor?
    let titleTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.isEditable = false
        textView.attributedText = StringConstants.attributedTitle
        textView.textAlignment = .center
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.isEditable = false
        textView.attributedText = StringConstants.attributedDescripttion
        textView.textAlignment = .justified
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var saveTodoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(StringConstants.saveEditedTodoButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 5
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        button.addTarget(self, action: #selector(editNewTodoButtonClick), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        layoutViews()
        let presenter = TodoDetailsPresenter()
        let interactor = TodoDetailsInteractor()
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    @objc func editNewTodoButtonClick() {
        interactor?.editTodo(todo: updatedTodo ?? TodoModel(), todoTitle: titleTextView.text, todoDescription: descriptionTextView.text)
    }
    
    func setNavigationBar() {
        self.navigationController?.navigationBar.tintColor = .black
        let addButton = UIButton(type: .custom)
        addButton.setTitle(StringConstants.editButtonTitle, for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.addTarget(self, action: #selector(handleEditTodoClick), for: .touchUpInside)
    }
    
    @objc func handleEditTodoClick() {
        titleTextView.layer.borderWidth = 1
        titleTextView.isEditable = true
        descriptionTextView.layer.borderWidth = 1
        descriptionTextView.isEditable = true
        saveTodoButton.isHidden = false
    }
    
    func layoutViews() {
        view.addSubview(titleTextView)
        view.addSubview(descriptionTextView)
        view.addSubview(saveTodoButton)
        setConstraints()
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            titleTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            titleTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            titleTextView.heightAnchor.constraint(equalToConstant: 50),
            descriptionTextView.topAnchor.constraint(equalTo: titleTextView.bottomAnchor, constant: 20),
            descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 300),
            saveTodoButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            saveTodoButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            saveTodoButton.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 50),
            saveTodoButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

extension TodoDetailsViewController: TodoDetailsDisplayLogic {
    func displayUpdatedTodo(todo: TodoModel) {
        updatedTodo = todo
        let alert = UIAlertController(title: StringConstants.successAlertTitle, message: StringConstants.successfullyEdited, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: StringConstants.ok, style: .default) { (action) -> Void in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(action)
        self.navigationController?.present(alert, animated: true, completion: nil)
    }
}
