//
//  MockAlbumPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 18.04.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsVIPER

final class MockAlbumPresenter: AlbumInteractorOutputProtocol, AlbumViewOutputProtocol {
    private(set) var didFetchAlbumDetailsCallCount = 0
    private(set) var didFetchAlbumDetailsArgsAlbums = [Album]()
    private(set) var didFetchAlbumDetailsArgsImages = [UIImage]()

    private(set) var viewDidLoadCalled = false

    func didFetchAlbumDetails(album: Album, image: UIImage) {
        didFetchAlbumDetailsCallCount += 1
        didFetchAlbumDetailsArgsAlbums.append(album)
        didFetchAlbumDetailsArgsImages.append(image)
    }

    func viewDidLoad() {
        viewDidLoadCalled = true
    }
}
