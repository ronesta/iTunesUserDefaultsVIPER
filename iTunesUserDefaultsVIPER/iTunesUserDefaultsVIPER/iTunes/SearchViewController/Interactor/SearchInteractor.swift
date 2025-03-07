//
//  SearchInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation

final class SearchInteractor: SearchInteractorProtocol {
    weak var presenter: SearchPresenterOutputProtocol?

    private let iTunesManager: ITunesManagerProtocol
    private let storageManager: StorageManagerProtocol

    init(iTunesManager: ITunesManagerProtocol,
         storageManager: StorageManagerProtocol
    ) {
        self.iTunesManager = iTunesManager
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

        iTunesManager.loadAlbums(albumName: term) { [weak self] result in
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
