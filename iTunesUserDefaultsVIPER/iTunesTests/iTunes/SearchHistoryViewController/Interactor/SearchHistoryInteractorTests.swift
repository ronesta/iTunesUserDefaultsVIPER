//
//  SearchHistoryInteractorTests.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsVIPER

final class SearchHistoryInteractorTests: XCTestCase {
    private var interactor: SearchHistoryInteractor!
    private var mockPresenter: MockSearchHistoryPresenter!
    private var mockStorageManager: MockStorageManager!

    override func setUp() {
        super.setUp()
        mockStorageManager = MockStorageManager()
        mockPresenter = MockSearchHistoryPresenter()
        interactor = SearchHistoryInteractor(storageManager: mockStorageManager)
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockStorageManager = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testLoadSearchHistoryCallsStorageManager() {
        let searchHistory = ["Search1", "Search2"]

        searchHistory.forEach { term in
            mockStorageManager.saveSearchTerm(term)
        }

        interactor.loadSearchHistory()

        XCTAssertEqual(mockStorageManager.searchHistory, searchHistory)
        XCTAssertEqual(mockPresenter.fetchedHistory, searchHistory)
    }
}
