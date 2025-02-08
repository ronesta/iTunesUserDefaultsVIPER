//
//  SearchHistoryTableViewDataSource.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation
import UIKit

protocol SearchHistoryDataSourceProtocol: AnyObject, UITableViewDataSource {
    var searchHistory: [String] { get set }
}

final class SearchHistoryTableViewDataSource: NSObject, SearchHistoryDataSourceProtocol {
    var searchHistory = [String]()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        searchHistory.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = searchHistory[indexPath.row]
        return cell
    }
}
