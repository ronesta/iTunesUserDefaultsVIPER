//
//  MockAlbumView.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 18.04.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsVIPER

final class MockAlbumView: AlbumViewInputProtocol {
    private(set) var displayAlbumDetailsCallCount = 0
    private(set) var displayAlbumDetailsArgsAlbums = [Album]()
    private(set) var displayAlbumDetailsArgsImages = [UIImage]()

    func displayAlbumDetails(album: Album, image: UIImage) {
        displayAlbumDetailsCallCount += 1
        displayAlbumDetailsArgsAlbums.append(album)
        displayAlbumDetailsArgsImages.append(image)
    }
}
