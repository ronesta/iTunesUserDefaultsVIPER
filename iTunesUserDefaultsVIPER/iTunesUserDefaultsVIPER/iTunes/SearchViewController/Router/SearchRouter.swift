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
        let networkManager = NetworkManager()
        let imageLoader = ImageLoader(storageManager: storageManager)

        let interactor = SearchInteractor(networkManager: networkManager,
                                          storageManager: storageManager
        )
        let router = SearchRouter()
        let presenter = SearchPresenter(interactor: interactor,
                                        router: router
        )
        let collectionViewDataSource = SearchCollectionViewDataSource(imageLoader: imageLoader)

        let view = SearchViewController(presenter: presenter,
                                        collectionViewDataSource: collectionViewDataSource
        )

        router.viewController = view
        presenter.view = view
        interactor.presenter = presenter

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
