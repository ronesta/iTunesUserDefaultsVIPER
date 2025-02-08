//
//  AlbumRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

final class AlbumRouter: AlbumRouterProtocol {
    static func createModule(with album: Album) -> UIViewController {
        let storageManager = StorageManager()
        let networkManager = NetworkManager(storageManager: storageManager)

        let view = AlbumViewController()
        let interactor = AlbumInteractor()
        let router = AlbumRouter()
        let presenter = AlbumPresenter(interactor: interactor,
                                       router: router,
                                       album: album
        )

        view.presenter = presenter
        presenter.view = view

        interactor.presenter = presenter
        interactor.networkManager = networkManager

        return view
    }
}
