//
//  MockSearchHistoryPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchHistoryPresenter {
    // MARK SearchHistoryInteractorOutputProtocol
    private(set) var didFetchSearchHistoryCallCount = 0
    private(set) var didFetchSearchHistoryArgs = [[String]]()

    // MARK SearchHistoryViewOutputProtocol
    private(set) var viewDidLoadCallCount = 0
    private(set) var didSelectAlbumCallCount = 0
    private(set) var didSelectAlbumArgsTerms = [String]()
}

// MARK SearchHistoryInteractorOutputProtocol
extension MockSearchHistoryPresenter: SearchHistoryInteractorOutputProtocol {
    func didFetchSearchHistory(_ history: [String]) {
        didFetchSearchHistoryCallCount += 1
        didFetchSearchHistoryArgs.append(history)
    }
}

// MARK SearchHistoryViewOutputProtocol
extension MockSearchHistoryPresenter: SearchHistoryViewOutputProtocol {
    func viewDidLoad() {
        viewDidLoadCallCount += 1
    }

    func didSelectAlbum(with term: String) {
        didSelectAlbumCallCount += 1
        didSelectAlbumArgsTerms.append(term)
    }
}
