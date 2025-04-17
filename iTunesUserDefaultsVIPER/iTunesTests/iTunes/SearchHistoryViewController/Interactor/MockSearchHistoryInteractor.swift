//
//  MockSearchHistoryInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchHistoryInteractor: SearchHistoryInteractorInputProtocol {
    private(set) var loadSearchHistoryCalled = false

    func loadSearchHistory() {
        loadSearchHistoryCalled = true
    }
}
