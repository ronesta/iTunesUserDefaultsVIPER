//
//  SearchHistoryAssembler.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 07.03.2025.
//

import Foundation
import UIKit

final class SearchHistoryAssembly {
    func createModule() -> UIViewController {
        let storageManager = StorageManager()

        let interactor = SearchHistoryInteractor(storageManager: storageManager)
        let router = SearchHistoryRouter()
        let presenter = SearchHistoryPresenter(interactor: interactor,
                                               router: router)
        let tableViewDataSource = SearchHistoryTableViewDataSource()

        let view = SearchHistoryViewController(presenter: presenter,
                                               tableViewDataSource: tableViewDataSource)

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
}
