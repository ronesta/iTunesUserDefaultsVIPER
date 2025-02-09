//
//  SearchDataSourceProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 09.02.2025.
//

import Foundation
import UIKit

protocol SearchDataSourceProtocol: AnyObject, UICollectionViewDataSource {
    var albums: [Album] { get set }
}
