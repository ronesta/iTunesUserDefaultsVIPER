//
//  SearchHistoryRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

final class SearchHistoryRouter: SearchHistoryRouterProtocol {
    weak var viewController: UIViewController?

    func createModule() -> UIViewController {
        let storageManager = StorageManager()

        let view = SearchHistoryViewController()
        let interactor = SearchHistoryInteractor()
        let router = SearchHistoryRouter()
        let presenter = SearchHistoryPresenter(view: view,
                                               interactor: interactor,
                                               router: router
        )
        let tableViewDataSource = SearchHistoryTableViewDataSource()

        view.presenter = presenter
        view.tableViewDataSource = tableViewDataSource

        interactor.presenter = presenter
        interactor.storageManager = storageManager

        router.viewController = view

        let navigationController = UINavigationController(rootViewController: view)
        let tabBarItem = UITabBarItem(title: "History",
                                      image: UIImage(systemName: "clock"),
                                      tag: 1)
        tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        navigationController.tabBarItem = tabBarItem

        return navigationController
    }

    func navigateBackToSearchWithTerm(with term: String) {
        let searchRouter = SearchRouter()

        guard let searchViewController = searchRouter.createModule() as? UINavigationController,
              let rootViewController = searchViewController.viewControllers.first as? SearchViewController else {
            return
        }

        rootViewController.searchBar.isHidden = true
        rootViewController.presenter?.viewDidLoad(with: term)

        viewController?.navigationController?.pushViewController(rootViewController, animated: true)
    }
}
