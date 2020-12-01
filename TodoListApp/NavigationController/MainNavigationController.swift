//
//  MainNavigationController.swift
//  TodoListApp
//
//  Created by mac on 13/10/2020.
//

import UIKit
class MainNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let listTodosVC = ListTodosTableViewController()
        viewControllers = [listTodosVC]
    }
}
