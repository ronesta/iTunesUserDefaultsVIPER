//
//  SearchHistoryPresenterOutputProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.03.2025.
//

import Foundation

protocol SearchHistoryInteractorOutputProtocol
: AnyObject {
    func didFetchSearchHistory(_ history: [String])
}
