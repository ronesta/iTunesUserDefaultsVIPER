//
//  SearchHistoryPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation

final class SearchHistoryPresenter {
    weak var view: SearchHistoryViewProtocol?

    private let interactor: SearchHistoryInteractorProtocol
    private let router: SearchHistoryRouterProtocol

    init(interactor: SearchHistoryInteractorProtocol,
         router: SearchHistoryRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - SearchHistoryPresenterInputProtocol
extension SearchHistoryPresenter: SearchHistoryPresenterInputProtocol {
    func viewDidLoad() {
        interactor.loadSearchHistory()
    }

    func didSelectAlbum(with term: String) {
        router.performSearch(with: term)
    }
}

// MARK: - SearchHistoryPresenterOutputProtocol
extension SearchHistoryPresenter: SearchHistoryPresenterOutputProtocol {
    func didFetchSearchHistory(_ history: [String]) {
        view?.updateSearchHistory(history)
    }
}
