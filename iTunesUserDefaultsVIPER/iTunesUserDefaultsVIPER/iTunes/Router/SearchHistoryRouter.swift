//
//  SearchHistoryRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

protocol SearchHistoryRouterProtocol: AnyObject {
    func navigateBackToSearchWithTerm(_ searchTerm: String)
}

class SearchHistoryRouter: SearchHistoryRouterProtocol {
    weak var viewController: UIViewController?

    static func createModule() -> SearchHistoryViewController {
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

        return view
    }

    func navigateBackToSearchWithTerm(_ searchTerm: String) {
        if let searchViewController = viewController?.navigationController?.viewControllers.first(where: { $0 is SearchViewController }) as? SearchViewController {
            searchViewController.searchBar.text = searchTerm
            searchViewController.presenter?.searchAlbums(with: searchTerm)
            viewController?.navigationController?.popToViewController(searchViewController, animated: true)
        }
    }
}
