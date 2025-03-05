//
//  SearchPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit.UIImage

final class SearchPresenter: SearchPresenterInputProtocol,
                             SearchPresenterOutputProtocol {
    weak var view: SearchViewProtocol?

    private let interactor: SearchInteractorProtocol
    private let router: SearchRouterProtocol

    init(interactor: SearchInteractorProtocol,
         router: SearchRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }

    func didTypeSearch(_ searchQuery: String) {
        guard !searchQuery.isEmpty else {
            return
        }

        interactor.searchAlbums(with: searchQuery)
    }

    func searchButtonClicked(with term: String?) {
        guard let term, !term.isEmpty else {
            return
        }

        interactor.saveSearchTerm(term)
        interactor.searchAlbums(with: term)
    }

    func searchFromHistory(with term: String) {
        interactor.searchAlbums(with: term)
    }

    func didFetchAlbums(_ albums: [Album]) {
        view?.updateAlbums(albums)
    }

    func didFailToFetchAlbums(_ error: String) {
        view?.showError(error)
    }

    func didSelectAlbum(_ album: Album) {
        router.navigateToAlbumDetails(with: album)
    }
}
