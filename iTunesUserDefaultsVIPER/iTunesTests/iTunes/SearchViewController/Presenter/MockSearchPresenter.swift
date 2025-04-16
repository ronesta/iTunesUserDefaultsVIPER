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

    func didFetchAlbums(_ albums: [Album]) {
        fetchedAlbums = albums
    }

    func didFailToFetchAlbums(_ error: String) {
        failedError = error
    }
}

