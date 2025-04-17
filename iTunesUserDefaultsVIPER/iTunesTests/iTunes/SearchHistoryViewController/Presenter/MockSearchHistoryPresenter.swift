//
//  MockSearchHistoryPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchHistoryPresenter: SearchHistoryInteractorOutputProtocol {
    var fetchedHistory: [String]?

    func didFetchSearchHistory(_ history: [String]) {
        fetchedHistory = history
    }
}
