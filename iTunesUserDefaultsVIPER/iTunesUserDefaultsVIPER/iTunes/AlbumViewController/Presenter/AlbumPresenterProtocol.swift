//
//  AlbumPresenterProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation
import UIKit.UIImage

protocol AlbumPresenterProtocol: AnyObject {
    func viewDidLoad()
    func didFetchAlbumDetails(album: Album, image: UIImage)
}
