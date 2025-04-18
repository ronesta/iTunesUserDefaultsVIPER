//
//  MockAlbumView.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 18.04.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsVIPER

final class MockAlbumView: AlbumViewInputProtocol {
    private(set) var displayedAlbum: Album?
    private(set) var displayedImage: UIImage?

    func displayAlbumDetails(album: Album, image: UIImage) {
        displayedAlbum = album
        displayedImage = image
    }
}
