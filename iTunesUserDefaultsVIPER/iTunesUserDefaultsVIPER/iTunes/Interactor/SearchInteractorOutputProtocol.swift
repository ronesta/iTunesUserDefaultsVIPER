//
//  SearchInteractorOutputProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation

protocol SearchInteractorOutputProtocol: AnyObject {
    func didFetchAlbums(_ albums: [Album])
    func didFailToFetchAlbums(with error: Error)
}
