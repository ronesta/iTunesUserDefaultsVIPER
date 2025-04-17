//
//  MockSearchPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchPresenter: SearchInteractorOutputProtocol {
    private(set) var fetchedAlbums: [Album]?
    private(set) var failedError: String?

    private(set) var searchButtonClickedTerm: String?
    private(set) var searchFromHistoryTerm: String?
    private(set) var didTypeSearchTerm: String?
    private(set) var didSelectAlbumWith: Album?

    func didFetchAlbums(_ albums: [Album]) {
        fetchedAlbums = albums
    }

    func didFailToFetchAlbums(_ error: String) {
        failedError = error
    }
}

extension MockSearchPresenter: SearchViewOutputProtocol {
    func searchButtonClicked(with term: String?) {
        searchButtonClickedTerm = term
    }

    func searchFromHistory(with term: String) {
        searchFromHistoryTerm = term
    }

    func didTypeSearch(_ text: String) {
        didTypeSearchTerm = text
    }

    func didSelectAlbum(_ album: Album) {
        didSelectAlbumWith = album
    }
}

