//
//  AlbumInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation

final class AlbumInteractor: AlbumInteractorProtocol {
    weak var presenter: AlbumPresenterOutputProtocol?

    private let imageLoader: ImageLoaderProtocol

    init(imageLoader: ImageLoaderProtocol) {
        self.imageLoader = imageLoader
    }

    func loadAlbumDetails(for album: Album) {
        imageLoader.loadImage(from: album.artworkUrl100) { [weak self] loadedImage in

            guard let loadedImage else {
                return
            }

            self?.presenter?.didFetchAlbumDetails(album: album, image: loadedImage)
        }
    }
}
