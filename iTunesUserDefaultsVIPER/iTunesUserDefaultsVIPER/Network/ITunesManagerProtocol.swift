//
//  NetworkManagerProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 06.02.2025.
//

import UIKit

protocol ITunesManagerProtocol: AnyObject {
    func loadAlbums(albumName: String, completion: @escaping (Result<[Album], Error>) -> Void)
}
