//
//  AlbumPresenterProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation
import UIKit

protocol AlbumPresenterProtocol: AnyObject {
    func loadAlbumDetails()
    func didFetchAlbumDetails(album: Album, image: UIImage)
}
