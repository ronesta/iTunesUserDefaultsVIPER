//
//  AlbumPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit.UIImage

final class AlbumPresenter {
    weak var view: AlbumViewProtocol?

    private let interactor: AlbumInteractorProtocol
    private let album: Album

    init(interactor: AlbumInteractorProtocol,
         album: Album
    ) {
        self.interactor = interactor
        self.album = album
    }
}

// MARK: - AlbumPresenterInputProtocol
extension AlbumPresenter: AlbumPresenterInputProtocol {
    func viewDidLoad() {
        interactor.loadAlbumDetails(for: album)
    }
}

// MARK: - AlbumPresenterOutputProtocol
extension AlbumPresenter: AlbumPresenterOutputProtocol {
    func didFetchAlbumDetails(album: Album, image: UIImage) {
        view?.displayAlbumDetails(album: album, image: image)
    }
}
