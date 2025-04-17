//
//  MockSearchHistoryView.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchHistoryView: SearchHistoryViewInputProtocol {
    private(set) var updatedSearchHistory: [String]?

    func updateSearchHistory(_ history: [String]) {
        updatedSearchHistory = history
    }
}
