//
//  SearchInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation

final class SearchInteractor: SearchInteractorInputProtocol {
    weak var presenter: SearchInteractorOutputProtocol?

    private let iTunesService: ITunesServiceProtocol
    private let storageManager: StorageManagerProtocol

    init(iTunesService: ITunesServiceProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.iTunesService = iTunesService
        self.storageManager = storageManager
    }

    func saveSearchTerm(_ term: String) {
        storageManager.saveSearchTerm(term)
    }

    func searchAlbums(with term: String) {
        if let savedAlbums = storageManager.loadAlbums(for: term) {
            self.presenter?.didFetchAlbums(savedAlbums)
            return
        }

        iTunesService.loadAlbums(albumName: term) { [weak self] result in
            switch result {
            case .success(let albums):
                self?.presenter?.didFetchAlbums(albums)
                self?.storageManager.saveAlbums(albums, for: term)
                    print("Successfully loaded \(albums.count) albums.")
            case .failure(let error):
                self?.presenter?.didFailToFetchAlbums(error.localizedDescription)
            }
        }
    }
}
