//
//  ListTodosTableViewController.swift
//  TodoListApp
//
//  Created by mac on 13/10/2020.
//

import UIKit
protocol ListTodosDisplayLogic {
    func displayListOfTodos(listOfTodos: [TodoModel])
    func displayRemovedTodo(todo: TodoModel)
}

class ListTodosTableViewController: UITableViewController {
    var arrayOfTodos: [TodoModel]?
    var deleteTodo: TodoModel?
    var interactor: ListTodosBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: StringConstants.cellId)
        tableView.tableFooterView = UIView()
        let presenter = ListTodosPresenter()
        let interactor = ListTodosInteractor()
        presenter.view = self
        interactor.presenter = presenter
        self.interactor = interactor
    }
    
    override func viewWillAppear(_ animated: Bool) {
        interactor?.listTodos(listOfTodos: arrayOfTodos ?? [TodoModel]())
        tableView.reloadData()
    }
    
    func setNavigationBar() {
        navigationItem.title = StringConstants.listTodosScreenTitle
        let addButton = UIButton(type: .custom)
        addButton.setTitle(StringConstants.addButtonTitle, for: .normal)
        addButton.setTitleColor(.black, for: .normal)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.addTarget(self, action: #selector(handleAddTodoClick), for: .touchUpInside)
    }
    
    @objc func handleAddTodoClick() {
        let viewController = AddTodoViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ListTodosTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfTodos?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StringConstants.cellId, for: indexPath)
        let list = arrayOfTodos?[indexPath.row]
        print(list ?? [])
        cell.textLabel?.text = list?.todoTitle
        let image = UIImage(systemName: StringConstants.seeDetailsArrow, withConfiguration: UIImage.SymbolConfiguration(weight: .regular))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        cell.accessoryView = UIImageView(image: image)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = TodoDetailsViewController()
        navigationController?.pushViewController(viewController, animated: true)
        viewController.titleTextView.text = arrayOfTodos?[indexPath.row].todoTitle
        viewController.descriptionTextView.text = arrayOfTodos?[indexPath.row].todoDescription
        viewController.updatedTodo = arrayOfTodos?[indexPath.row]
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let todo = arrayOfTodos?[indexPath.row] ?? TodoModel()
            interactor?.deleteTodo(todo: todo)
            self.arrayOfTodos?.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension ListTodosTableViewController: ListTodosDisplayLogic {
    func displayRemovedTodo(todo: TodoModel) {
        tableView.reloadData()
    }
    
    func displayListOfTodos(listOfTodos: [TodoModel]) {
        arrayOfTodos = listOfTodos
    }
}
