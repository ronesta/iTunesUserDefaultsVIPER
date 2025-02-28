//
//  SearchPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit.UIImage

final class SearchPresenter: SearchPresenterProtocol {
    weak var view: SearchViewProtocol?
    private let interactor: SearchInteractorProtocol
    private let router: SearchRouterProtocol

    init(view: SearchViewProtocol?,
         interactor: SearchInteractorProtocol,
         router: SearchRouterProtocol
    ) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad(with term: String) {
        searchAlbums(with: term)
    }

    func searchAlbums(with searchTerm: String) {
        interactor.searchAlbums(with: searchTerm)
    }

    func didFetchAlbums(_ albums: [Album]) {
        view?.updateAlbums(albums)
    }

    func didFailToFetchAlbums(_ error: String) {
        view?.showError(error)
    }

    func loadImage(for album: Album, completion: @escaping (UIImage?) -> Void) {
        interactor.loadImage(for: album, completion: completion)
    }

    func didSelectAlbum(_ album: Album) {
        router.navigateToAlbumDetails(with: album)
    }
}
