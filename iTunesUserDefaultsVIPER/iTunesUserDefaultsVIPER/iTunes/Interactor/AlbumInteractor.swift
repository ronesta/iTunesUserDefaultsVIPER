//
//  AlbumInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

protocol AlbumInteractorProtocol: AnyObject {
    func loadAlbumDetails(for album: Album)
}

final class AlbumInteractor: AlbumInteractorProtocol {
    var presenter: AlbumPresenterProtocol?
    var networkManager: NetworkManagerProtocol?

    func loadAlbumDetails(for album: Album) {
        networkManager?.loadImage(from: album.artworkUrl100) { [weak self] loadedImage in

            guard let self,
            let loadedImage else {
                return
            }

            presenter?.didFetchAlbumDetails(album: album, image: loadedImage)
        }
    }
}
