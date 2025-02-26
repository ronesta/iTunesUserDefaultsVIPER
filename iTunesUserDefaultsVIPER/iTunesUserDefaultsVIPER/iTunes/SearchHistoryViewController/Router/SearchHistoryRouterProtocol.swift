//
//  SearchHistoryRouterProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation
import UIKit

protocol SearchHistoryRouterProtocol: AnyObject {
    func createModule() -> UIViewController
    func navigateBackToSearchWithTerm(with term: String)
}
