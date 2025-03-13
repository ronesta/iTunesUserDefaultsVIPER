//
//  AlbumViewProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit.UIImage

protocol AlbumViewInputProtocol: AnyObject {
    func displayAlbumDetails(album: Album, image: UIImage)
}
