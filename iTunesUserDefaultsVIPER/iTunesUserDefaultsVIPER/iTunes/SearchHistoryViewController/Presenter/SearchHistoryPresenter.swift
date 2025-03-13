//
//  SearchHistoryPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation

final class SearchHistoryPresenter {
    weak var view: SearchHistoryViewInputProtocol?

    private let interactor: SearchHistoryInteractorInputProtocol
    private let router: SearchHistoryRouterProtocol

    init(interactor: SearchHistoryInteractorInputProtocol,
         router: SearchHistoryRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
}

// MARK: - SearchHistoryViewOutputProtocol
extension SearchHistoryPresenter: SearchHistoryViewOutputProtocol {
    func viewDidLoad() {
        interactor.loadSearchHistory()
    }

    func didSelectAlbum(with term: String) {
        router.performSearch(with: term)
    }
}

// MARK: - SearchHistoryInteractorOutputProtocol
extension SearchHistoryPresenter: SearchHistoryInteractorOutputProtocol {
    func didFetchSearchHistory(_ history: [String]) {
        view?.updateSearchHistory(history)
    }
}
