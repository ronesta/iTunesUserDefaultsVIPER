//
//  AlbumRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

protocol AlbumRouterProtocol: AnyObject {
    static func createModule(with album: Album) -> UIViewController
}

final class AlbumRouter: AlbumRouterProtocol {
    static func createModule(with album: Album) -> UIViewController {
        let view = AlbumViewController()
        let presenter = AlbumPresenter(album: album)
        let interactor = AlbumInteractor()
        //let router = AlbumRouter()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        //presenter.router = router
        interactor.presenter = presenter

        return view
    }
}
