//
//  SearchRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit.UIViewController

final class SearchRouter: SearchRouterProtocol {
    weak var viewController: UIViewController?

    func createModule() -> UIViewController {
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
        let albumRouter = AlbumRouter()

        let albumViewController = albumRouter.createModule(with: album)
        viewController?.navigationController?.pushViewController(albumViewController, animated: true)
    }
}
