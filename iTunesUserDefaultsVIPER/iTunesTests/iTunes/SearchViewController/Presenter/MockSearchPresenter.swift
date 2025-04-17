//
//  MockSearchPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchPresenter {
    private(set) var fetchedAlbums: [Album]?
    private(set) var failedError: String?

    private(set) var searchButtonClickedTerm: String?
    private(set) var searchFromHistoryTerm: String?
    private(set) var didTypeSearchQuery: String?
    private(set) var didSelectAlbumWith: Album?
}

// MARK: - SearchInteractorOutputProtocol
extension MockSearchPresenter: SearchInteractorOutputProtocol {
    func didFetchAlbums(_ albums: [Album]) {
        fetchedAlbums = albums
    }

    func didFailToFetchAlbums(_ error: String) {
        failedError = error
    }
}

// MARK: - SearchViewOutputProtocol
extension MockSearchPresenter: SearchViewOutputProtocol {
    func searchButtonClicked(with term: String?) {
        searchButtonClickedTerm = term
    }

    func searchFromHistory(with term: String) {
        searchFromHistoryTerm = term
    }

    func didTypeSearch(_ text: String) {
        didTypeSearchQuery = text
    }

    func didSelectAlbum(_ album: Album) {
        didSelectAlbumWith = album
    }
}

