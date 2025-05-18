//
//  MockSearchHistoryView.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchHistoryView: SearchHistoryViewInputProtocol {
    private(set) var updateSearchHistoryCallCount = 0
    private(set) var updateSearchHistoryArgsHistory = [[String]]()

    func updateSearchHistory(_ history: [String]) {
        updateSearchHistoryCallCount += 1
        updateSearchHistoryArgsHistory.append(history)
    }
}
