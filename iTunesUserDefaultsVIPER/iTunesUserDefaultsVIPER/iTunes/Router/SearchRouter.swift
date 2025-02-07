//
//  SearchRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

protocol SearchRouterProtocol: AnyObject {
    func navigateToAlbumDetails(with album: Album)
}

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

        view.presenter = presenter
        view.storageManager = storageManager
        interactor.presenter = presenter
        interactor.networkManager = networkManager
        interactor.storageManager = storageManager
        router.viewController = view

        return view
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
