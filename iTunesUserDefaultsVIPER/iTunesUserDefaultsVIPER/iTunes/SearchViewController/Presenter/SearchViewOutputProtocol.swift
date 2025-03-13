//
//  SearchPresenterProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation

protocol SearchViewOutputProtocol: AnyObject {
    func didTypeSearch(_ searchQuery: String)

    func searchButtonClicked(with term: String?)

    func searchFromHistory(with term: String)

    func didSelectAlbum(_ album: Album)
}
