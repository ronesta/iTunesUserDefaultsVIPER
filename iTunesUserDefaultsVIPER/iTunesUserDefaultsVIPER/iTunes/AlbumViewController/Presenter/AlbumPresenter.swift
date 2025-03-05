//
//  AlbumPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit.UIImage

final class AlbumPresenter: AlbumPresenterInputProtocol, AlbumPresenterOutputProtocol {
    weak var view: AlbumViewProtocol?

    private let interactor: AlbumInteractorProtocol
    private let album: Album

    init(interactor: AlbumInteractorProtocol,
         album: Album
    ) {
        self.interactor = interactor
        self.album = album
    }

    func viewDidLoad() {
        interactor.loadAlbumDetails(for: album)
    }

    func didFetchAlbumDetails(album: Album, image: UIImage) {
        view?.displayAlbumDetails(album: album, image: image)
    }
}
