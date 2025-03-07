//
//  SearchRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

final class SearchRouter: SearchRouterProtocol {
    weak var viewController: UIViewController?

    func navigateToAlbumDetails(with album: Album) {
        let albumRouter = AlbumAssembly()

        let albumViewController = albumRouter.createModule(with: album)
        viewController?.navigationController?.pushViewController(albumViewController, animated: true)
    }
}
