//
//  SearchHistoryInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation

protocol SearchHistoryInteractorProtocol: AnyObject {
    func loadSearchHistory()
}

class SearchHistoryInteractor: SearchHistoryInteractorProtocol {
    var presenter: SearchHistoryPresenterProtocol?
    var storageManager: StorageManagerProtocol?

    func loadSearchHistory() {
        guard let history = storageManager?.getSearchHistory() else {
            return
        }

        presenter?.didFetchSearchHistory(history)
    }
}
