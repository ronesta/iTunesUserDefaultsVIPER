//
//  MockSearchHistoryPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchHistoryPresenter {
    private(set) var fetchedHistory: [String]?

    private(set) var viewDidLoadCalled = false
    private(set) var selectedTerm: String? = nil
}

// MARK: - SearchHistoryInteractorOutputProtocol
extension MockSearchHistoryPresenter: SearchHistoryInteractorOutputProtocol {

    func didFetchSearchHistory(_ history: [String]) {
        fetchedHistory = history
    }
}

// MARK: - SearchHistoryViewOutputProtocol
extension MockSearchHistoryPresenter: SearchHistoryViewOutputProtocol {
    func viewDidLoad() {
        viewDidLoadCalled = true
    }

    func didSelectAlbum(with term: String) {
        selectedTerm = term
    }
}
