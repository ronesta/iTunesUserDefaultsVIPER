//
//  SearchHistoryPresenterProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation

protocol SearchHistoryPresenterInputProtocol: AnyObject {
    func viewDidLoad()

    func didSelectAlbum(with term: String)
}
