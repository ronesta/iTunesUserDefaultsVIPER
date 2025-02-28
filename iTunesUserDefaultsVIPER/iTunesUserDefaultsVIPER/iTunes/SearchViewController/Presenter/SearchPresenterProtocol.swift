//
//  SearchPresenterProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation
import UIKit.UIImage

protocol SearchPresenterProtocol: AnyObject {
    func viewDidLoad(with term: String)

    func didFetchAlbums(_ albums: [Album])

    func didFailToFetchAlbums(_ error: String)

    func loadImage(for album: Album, completion: @escaping (UIImage?) -> Void)

    func didSelectAlbum(_ album: Album)
}
