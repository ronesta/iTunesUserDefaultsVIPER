//
//  MockRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockHistoryRouter: SearchHistoryRouterProtocol {
    private(set) var performedSearchTerm: String?

    func performSearch(with term: String) {
        performedSearchTerm = term
    }
}
