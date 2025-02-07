//
//  SearchHistoryBuilder.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 07.02.2025.
//

import Foundation
import UIKit

final class SearchHistoryBuilder {
    static func build() -> UIViewController {
        let storageManager = StorageManager()

        let view = SearchHistoryViewController()
        let interactor = SearchHistoryInteractor()
        let router = SearchHistoryRouter()
        let presenter = SearchHistoryPresenter(view: view,
                                               interactor: interactor,
                                               router: router
        )

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
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
}
