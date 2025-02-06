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
    func navigateToSearchHistory()
}

final class SearchRouter: SearchRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = SearchViewController()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
        let router = SearchRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    func navigateToAlbumDetails(with album: Album) {
        let albumVC = AlbumRouter.createModule(with: album)
        viewController?.navigationController?.pushViewController(albumVC, animated: true)
    }

    func navigateToSearchHistory() {
        let historyVC = SearchHistoryRouter.createModule()
        viewController?.navigationController?.pushViewController(historyVC, animated: true)
    }

//    func navigateToAlbumDetails(with album: Album) {
//        let albumDetailsVC = AlbumDetailsModuleBuilder.build(with: album)
//        viewController?.navigationController?.pushViewController(albumDetailsVC, animated: true)
//    }
//
//    func navigateToSearchHistory() {
//        let searchHistoryVC = SearchHistoryModuleBuilder.build()
//        viewController?.navigationController?.pushViewController(searchHistoryVC, animated: true)
//    }
}
