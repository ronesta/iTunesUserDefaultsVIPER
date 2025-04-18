//
//  MockAlbumPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 18.04.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsVIPER

final class MockAlbumPresenter: AlbumInteractorOutputProtocol {
    private(set) var receivedAlbum: Album?
    private(set) var receivedImage: UIImage?

    func didFetchAlbumDetails(album: Album, image: UIImage) {
        receivedAlbum = album
        receivedImage = image
    }
}
