//
//  SearchHistoryRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit.UIViewController

final class SearchHistoryRouter: SearchHistoryRouterProtocol {
    weak var viewController: UIViewController?

    func createModule() -> UIViewController {
        let storageManager = StorageManager()

        let interactor = SearchHistoryInteractor(storageManager: storageManager)
        let router = SearchHistoryRouter()
        let presenter = SearchHistoryPresenter(interactor: interactor,
                                               router: router
        )
        let tableViewDataSource = SearchHistoryTableViewDataSource()

        let view = SearchHistoryViewController(presenter: presenter,
                                               tableViewDataSource: tableViewDataSource
        )

        router.viewController = view
        presenter.view = view
        interactor.presenter = presenter

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

        rootViewController.performSearch(with: term)

        viewController?.navigationController?.pushViewController(rootViewController, animated: true)
    }
}
