//
//  SearchAssembler.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 07.03.2025.
//

import Foundation
import UIKit

final class SearchAssembly {
    func createModule() -> UIViewController {
        let storageManager = StorageManager()
        let iTunesService = ITunesService()
        let imageLoader = ImageLoader(storageManager: storageManager)

        let interactor = SearchInteractor(iTunesService: iTunesService,
                                          storageManager: storageManager)
        let router = SearchRouter()
        let presenter = SearchPresenter(interactor: interactor,
                                        router: router)
        let collectionViewDataSource = SearchCollectionViewDataSource(imageLoader: imageLoader)

        let view = SearchViewController(presenter: presenter,
                                        collectionViewDataSource: collectionViewDataSource)

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
}
