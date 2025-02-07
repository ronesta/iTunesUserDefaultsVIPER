//
//  AlbumPresenter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

protocol AlbumPresenterProtocol: AnyObject {
    func loadAlbumDetails()
    func didFetchAlbumDetails(album: Album, image: UIImage)
}

final class AlbumPresenter: AlbumPresenterProtocol {
    weak var view: AlbumViewProtocol?
    var interactor: AlbumInteractorProtocol?
    var router: AlbumRouterProtocol?
    private let album: Album

    init(interactor: AlbumInteractorProtocol?,
         router: AlbumRouterProtocol?,
         album: Album
    ) {
        self.interactor = interactor
        self.router = router
        self.album = album
    }

    func loadAlbumDetails() {
        interactor?.loadAlbumDetails(for: album)
    }

    func didFetchAlbumDetails(album: Album, image: UIImage) {
        view?.displayAlbumDetails(album: album, image: image)
    }
}
