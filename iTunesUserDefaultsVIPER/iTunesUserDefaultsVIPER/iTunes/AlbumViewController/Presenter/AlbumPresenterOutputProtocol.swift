//
//  AlbumPresenterInputProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.03.2025.
//

import Foundation
import UIKit.UIImage

protocol AlbumPresenterOutputProtocol: AnyObject {
    func didFetchAlbumDetails(album: Album, image: UIImage)
}
