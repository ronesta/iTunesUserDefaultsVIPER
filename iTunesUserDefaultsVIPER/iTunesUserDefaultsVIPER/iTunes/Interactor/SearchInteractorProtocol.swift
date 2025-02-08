//
//  SearchInteractorProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation
import UIKit

protocol SearchInteractorProtocol: AnyObject {
    func searchAlbums(with term: String)
    func loadImage(for album: Album, completion: @escaping (UIImage?) -> Void)
}
