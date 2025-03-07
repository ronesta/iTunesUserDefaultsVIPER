//
//  AlbumRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

final class AlbumAssembly {
    func createModule(with album: Album) -> UIViewController {
        let storageManager = StorageManager()
        let imageLoader = ImageLoader(storageManager: storageManager)

        let interactor = AlbumInteractor(imageLoader: imageLoader)
        let presenter = AlbumPresenter(interactor: interactor,
                                       album: album
        )

        let view = AlbumViewController(presenter: presenter)

        presenter.view = view
        interactor.presenter = presenter

        return view
    }
}
