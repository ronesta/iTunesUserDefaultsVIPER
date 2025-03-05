//
//  SearchHistoryInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation

final class SearchHistoryInteractor: SearchHistoryInteractorProtocol {
    weak var presenter: SearchHistoryPresenterOutputProtocol?

    private let storageManager: StorageManagerProtocol

    init(storageManager: StorageManagerProtocol) {
        self.storageManager = storageManager
    }

    func loadSearchHistory() {
        let history = storageManager.getSearchHistory()

        presenter?.didFetchSearchHistory(history)
    }
}
