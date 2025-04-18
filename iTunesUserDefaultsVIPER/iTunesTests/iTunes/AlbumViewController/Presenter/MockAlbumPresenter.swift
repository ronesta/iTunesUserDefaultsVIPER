//
//  MockAlbumPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 18.04.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsVIPER

final class MockAlbumPresenter: AlbumInteractorOutputProtocol, AlbumViewOutputProtocol {
    private(set) var receivedAlbum: Album?
    private(set) var receivedImage: UIImage?

    private(set) var viewDidLoadCalled = false

    func didFetchAlbumDetails(album: Album, image: UIImage) {
        receivedAlbum = album
        receivedImage = image
    }

    func viewDidLoad() {
        viewDidLoadCalled = true
    }
}
