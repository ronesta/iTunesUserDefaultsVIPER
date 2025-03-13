//
//  AlbumPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit.UIImage

final class AlbumPresenter {
    weak var view: AlbumViewInputProtocol?

    private let interactor: AlbumInteractorInputProtocol
    private let album: Album

    init(interactor: AlbumInteractorInputProtocol,
         album: Album
    ) {
        self.interactor = interactor
        self.album = album
    }
}

// MARK: - AlbumViewOutputProtocol
extension AlbumPresenter: AlbumViewOutputProtocol {
    func viewDidLoad() {
        interactor.loadAlbumDetails(for: album)
    }
}

// MARK: - AlbumInteractorOutputProtocol
extension AlbumPresenter: AlbumInteractorOutputProtocol {
    func didFetchAlbumDetails(album: Album, image: UIImage) {
        view?.displayAlbumDetails(album: album, image: image)
    }
}
