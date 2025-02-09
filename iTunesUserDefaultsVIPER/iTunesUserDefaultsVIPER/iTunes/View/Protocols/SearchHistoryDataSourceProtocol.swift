//
//  SearchHistoryDataSourceProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 09.02.2025.
//

import Foundation
import UIKit

protocol SearchHistoryDataSourceProtocol: AnyObject, UITableViewDataSource {
    var searchHistory: [String] { get set }
}
