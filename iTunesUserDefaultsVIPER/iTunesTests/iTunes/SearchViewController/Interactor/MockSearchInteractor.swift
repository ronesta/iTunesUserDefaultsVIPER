//
//  MockSearchInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchInteractor: SearchInteractorInputProtocol {
    private(set) var searchQueries = [String]()
    private(set) var searchHistory = [String]()

    func searchAlbums(with term: String) {
        searchQueries.append(term)
    }

    func saveSearchTerm(_ term: String) {
        searchHistory.append(term)
    }
}
