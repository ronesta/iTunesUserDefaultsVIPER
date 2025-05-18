//
//  MockRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockHistoryRouter: SearchHistoryRouterProtocol {
    private(set) var performSearchCallCount = 0
    private(set) var performSearchArgsTerms = [String]()

    func performSearch(with term: String) {
        performSearchCallCount += 1
        performSearchArgsTerms.append(term)
    }
}
