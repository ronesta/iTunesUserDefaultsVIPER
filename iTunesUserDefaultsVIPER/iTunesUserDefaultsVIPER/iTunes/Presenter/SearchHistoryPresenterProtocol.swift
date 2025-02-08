//
//  SearchHistoryPresenterProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation

protocol SearchHistoryPresenterProtocol: AnyObject {
    func loadSearchHistory()
    func didFetchSearchHistory(_ history: [String])
}
