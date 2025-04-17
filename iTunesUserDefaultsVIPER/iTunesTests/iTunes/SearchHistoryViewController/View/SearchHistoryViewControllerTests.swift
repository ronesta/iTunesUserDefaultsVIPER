//
//  SearchHistoryViewControllerTests.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsVIPER

final class SearchHistoryViewControllerTests: XCTestCase {
    private var mockPresenter: MockSearchHistoryPresenter!
    private var mockDataSource: MockSearchHistoryDataSource!
    private var viewController: SearchHistoryViewController!

    override func setUp() {
        super.setUp()
        mockPresenter = MockSearchHistoryPresenter()
        mockDataSource = MockSearchHistoryDataSource()
        viewController = SearchHistoryViewController(
            presenter: mockPresenter,
            tableViewDataSource: mockDataSource
        )
    }

    override func tearDown() {
        mockPresenter = nil
        mockDataSource = nil
        viewController = nil
        super.tearDown()
    }

    func testViewWillAppearCallsPresenterViewDidLoad() {
        viewController.viewWillAppear(false)

        XCTAssertTrue(mockPresenter.viewDidLoadCalled)
    }

    func testUpdateSearchHistoryReloadsTableView() {
        let searchHistory = ["Search1", "Search2"]
        viewController.updateSearchHistory(searchHistory)

        XCTAssertEqual(mockDataSource.searchHistory, searchHistory)
    }
}
