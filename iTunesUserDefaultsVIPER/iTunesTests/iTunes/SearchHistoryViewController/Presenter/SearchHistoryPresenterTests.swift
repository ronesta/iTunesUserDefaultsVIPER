//
//  SearchHistoryPresenterTests.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 17.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsVIPER

final class SearchHistoryPresenterTests: XCTestCase {
    private var presenter: SearchHistoryPresenter!
    private var mockView: MockSearchHistoryView!
    private var mockInteractor: MockSearchHistoryInteractor!
    private var mockRouter: MockHistoryRouter!

    override func setUp() {
        super.setUp()
        mockView = MockSearchHistoryView()
        mockInteractor = MockSearchHistoryInteractor()
        mockRouter = MockHistoryRouter()
        presenter = SearchHistoryPresenter(interactor: mockInteractor,
                                           router: mockRouter
        )
        presenter.view = mockView
    }
    
    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }

    func testViewDidLoadCallsInteractor() {
        presenter.viewDidLoad()

        XCTAssertTrue(mockInteractor.loadSearchHistoryCalled)
    }
    
    func testDidSelectAlbumCallsRouterPerformSearch() {
        let term = "DidSelectAlbum"
        presenter.didSelectAlbum(with: term)

        XCTAssertEqual(mockRouter.performedSearchTerm, term)
    }
    
    func testDidFetchSearchHistoryUpdatesView() {
        let searchHistory = ["Search1", "Search2"]

        presenter.didFetchSearchHistory(searchHistory)

        XCTAssertEqual(mockView.updatedSearchHistory, searchHistory)
    }
}
