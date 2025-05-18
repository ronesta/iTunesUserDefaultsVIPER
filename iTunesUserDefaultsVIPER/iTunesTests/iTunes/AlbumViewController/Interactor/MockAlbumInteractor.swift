//
//  MockAlbumInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 18.04.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsVIPER

final class MockAlbumInteractor: AlbumInteractorInputProtocol {
    private(set) var loadAlbumDetailsCallCount = 0
    private(set) var loadAlbumDetailsArgsAlbums = [Album]()

    func loadAlbumDetails(for album: Album) {
        loadAlbumDetailsCallCount += 1
        loadAlbumDetailsArgsAlbums.append(album)
    }
}
