//
//  MockSearchInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchInteractor: SearchInteractorInputProtocol {
    private(set) var searchAlbumsCallCount = 0
    private(set) var searchAlbumsArgsTerms = [String]()

    private(set) var saveSearchTermCallCount = 0
    private(set) var saveSearchTermArgsTerms = [String]()

    func searchAlbums(with term: String) {
        searchAlbumsCallCount += 1
        searchAlbumsArgsTerms.append(term)
    }

    func saveSearchTerm(_ term: String) {
        saveSearchTermCallCount += 1
        saveSearchTermArgsTerms.append(term)
    }
}
