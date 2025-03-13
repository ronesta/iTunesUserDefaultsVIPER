//
//  SearchHistoryViewProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation

protocol SearchHistoryViewInputProtocol: AnyObject {
    func updateSearchHistory(_ history: [String])
}
