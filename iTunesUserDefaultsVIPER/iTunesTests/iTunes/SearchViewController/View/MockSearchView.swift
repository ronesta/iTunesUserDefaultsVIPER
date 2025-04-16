//
//  MockSearchView.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchView: SearchViewInputProtocol {
    private(set) var albums: [Album]?
    private(set) var errorMessage: String?

    func updateAlbums(_ albums: [Album]) {
        self.albums = albums
    }
    
    func showError(_ message: String) {
        errorMessage = message
    }
}
