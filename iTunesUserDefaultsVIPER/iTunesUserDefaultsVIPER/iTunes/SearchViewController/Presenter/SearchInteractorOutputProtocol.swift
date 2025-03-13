//
//  SearchPresenterOutputProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.03.2025.
//

import Foundation

protocol SearchInteractorOutputProtocol: AnyObject {
    func didFetchAlbums(_ albums: [Album])

    func didFailToFetchAlbums(_ error: String)
}
