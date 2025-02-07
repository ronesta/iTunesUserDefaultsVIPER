//
//  SearchHistoryPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation

protocol SearchHistoryPresenterProtocol: AnyObject {
    func loadSearchHistory()
    func didFetchSearchHistory(_ history: [String])
    func didSelectSearchTerm(_ searchTerm: String)
}

class SearchHistoryPresenter: SearchHistoryPresenterProtocol {
    weak var view: SearchHistoryViewProtocol?
    var interactor: SearchHistoryInteractorProtocol?
    var router: SearchHistoryRouterProtocol?

    init(view: SearchHistoryViewProtocol?,
         interactor: SearchHistoryInteractorProtocol?,
         router: SearchHistoryRouterProtocol?
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func loadSearchHistory() {
        interactor?.loadSearchHistory()
    }

    func didFetchSearchHistory(_ history: [String]) {
        view?.updateSearchHistory(history)
    }

    func didSelectSearchTerm(_ searchTerm: String) {
        router?.navigateBackToSearchWithTerm(searchTerm)
    }
}
