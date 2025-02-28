//
//  SearchInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit.UIImage

final class SearchInteractor: SearchInteractorProtocol {
    var presenter: SearchPresenterProtocol?
    var networkManager: NetworkManagerProtocol?
    var storageManager: StorageManagerProtocol?

    func searchAlbums(with term: String) {
        storageManager?.saveSearchTerm(term)

        if let savedAlbums = storageManager?.loadAlbums(for: term) {
            self.presenter?.didFetchAlbums(savedAlbums)
            return
        }

        networkManager?.loadAlbums(albumName: term) { [weak self] result in
            switch result {
            case .success(let albums):
                self?.presenter?.didFetchAlbums(albums)
                self?.storageManager?.saveAlbums(albums, for: term)
                    print("Successfully loaded \(albums.count) albums.")
            case .failure(let error):
                self?.presenter?.didFailToFetchAlbums(error.localizedDescription)
            }
        }
    }

    func loadImage(for album: Album, completion: @escaping (UIImage?) -> Void) {
        networkManager?.loadImage(from: album.artworkUrl100, completion: completion)
    }
}
