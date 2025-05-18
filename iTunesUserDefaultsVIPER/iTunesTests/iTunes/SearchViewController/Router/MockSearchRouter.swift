//
//  MockSearchRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchRouter: SearchRouterProtocol {
    private(set) var navigateToAlbumDetailsCallCount = 0
    private(set) var navigateToAlbumDetailsArgsAlbums = [Album]()

    func navigateToAlbumDetails(with album: Album) {
        navigateToAlbumDetailsCallCount += 1
        navigateToAlbumDetailsArgsAlbums.append(album)
    }
}
