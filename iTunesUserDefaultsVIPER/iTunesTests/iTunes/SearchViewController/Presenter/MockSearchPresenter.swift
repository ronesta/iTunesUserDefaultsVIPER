//
//  MockSearchPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchPresenter {
    // MARK: - SearchInteractorOutputProtocol
    private(set) var didFetchAlbumsCallCount = 0
    private(set) var didFetchAlbumsArgs = [[Album]]()

    private(set) var didFailToFetchAlbumsCallCount = 0
    private(set) var didFailToFetchAlbumsArgs = [String]()

    // MARK: - SearchViewOutputProtocol
    private(set) var didTypeSearchCallCount = 0
    private(set) var didTypeSearchArgsQueries = [String]()

    private(set) var searchButtonClickedCallCount = 0
    private(set) var searchButtonClickedArgsTerms = [String?]()

    private(set) var searchFromHistoryCallCount = 0
    private(set) var searchFromHistoryArgsTerms = [String]()

    private(set) var didSelectAlbumCallCount = 0
    private(set) var didSelectAlbumWith = [Album]()
}

// MARK: - SearchInteractorOutputProtocol
extension MockSearchPresenter: SearchInteractorOutputProtocol {
    func didFetchAlbums(_ albums: [Album]) {
        didFetchAlbumsCallCount += 1
        didFetchAlbumsArgs.append(albums)
    }

    func didFailToFetchAlbums(_ error: String) {
        didFailToFetchAlbumsCallCount += 1
        didFailToFetchAlbumsArgs.append(error)
    }
}

// MARK: - SearchViewOutputProtocol
extension MockSearchPresenter: SearchViewOutputProtocol {
    func didTypeSearch(_ text: String) {
        didTypeSearchCallCount += 1
        didTypeSearchArgsQueries.append(text)
    }

    func searchButtonClicked(with term: String?) {
        searchButtonClickedCallCount += 1
        searchButtonClickedArgsTerms.append(term)
    }

    func searchFromHistory(with term: String) {
        searchFromHistoryCallCount += 1
        searchFromHistoryArgsTerms.append(term)
    }

    func didSelectAlbum(_ album: Album) {
        didSelectAlbumCallCount += 1
        didSelectAlbumWith.append(album)
    }
}

