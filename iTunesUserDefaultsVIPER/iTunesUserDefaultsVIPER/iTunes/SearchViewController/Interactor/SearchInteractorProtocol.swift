//
//  SearchInteractorProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation

protocol SearchInteractorProtocol: AnyObject {
    func saveSearchTerm(_ term: String)

    func searchAlbums(with term: String)
}
