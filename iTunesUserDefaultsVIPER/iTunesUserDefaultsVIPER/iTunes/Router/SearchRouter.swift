//
//  SearchRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

final class SearchRouter: SearchRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let storageManager = StorageManager()
        let networkManager = NetworkManager(storageManager: storageManager)

        let view = SearchViewController()
        let interactor = SearchInteractor()
        let router = SearchRouter()
        let presenter = SearchPresenter(view: view,
                                        interactor: interactor,
                                        router: router
        )
        let collectionViewDataSource = SearchCollectionViewDataSource(presenter: presenter)

        view.presenter = presenter
        view.storageManager = storageManager
        view.collectionViewDataSource = collectionViewDataSource
        interactor.presenter = presenter
        interactor.networkManager = networkManager
        interactor.storageManager = storageManager
        router.viewController = view

        let navigationController = UINavigationController(rootViewController: view)
        let tabBarItem = UITabBarItem(title: "Search",
                                      image: UIImage(systemName: "magnifyingglass"),
                                      tag: 0)
        tabBarItem.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 16)], for: .normal)
        navigationController.tabBarItem = tabBarItem

        return navigationController
    }

    func navigateToAlbumDetails(with album: Album) {
        let albumVC = AlbumRouter.createModule(with: album)
        viewController?.navigationController?.pushViewController(albumVC, animated: true)
    }

    func performSearch(for term: String) {
        let searchViewController = SearchRouter.createModule()
        guard let rootViewController = searchViewController as? SearchViewController else {
            return
        }

        rootViewController.searchBar.isHidden = true
        rootViewController.presenter?.searchAlbums(with: term)

        viewController?.navigationController?.pushViewController(rootViewController, animated: true)
    }
}
