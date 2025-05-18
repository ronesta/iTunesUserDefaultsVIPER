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

    func test_GivenPresenter_WhenViewDidLoad_ThenInteractorIsCalled() {
        // Given presenter

        // When
        presenter.viewDidLoad()

        // Then
        XCTAssertTrue(mockInteractor.loadSearchHistoryCalled)
    }

    func test_GivenPresenter_WhenDidSelectAlbum_ThenRouterPerformSearchIsCalledWithTerm() {
        // Given
        let term = "DidSelectAlbum"

        // When
        presenter.didSelectAlbum(with: term)

        // Then
        XCTAssertEqual(mockRouter.performedSearchTerm, term)
    }

    func test_GivenPresenter_WhenDidFetchSearchHistory_ThenViewIsUpdated() {
        // Given
        let searchHistory = ["Search1", "Search2"]

        // When
        presenter.didFetchSearchHistory(searchHistory)

        // Then
        XCTAssertEqual(mockView.updatedSearchHistory, searchHistory)
    }
}
