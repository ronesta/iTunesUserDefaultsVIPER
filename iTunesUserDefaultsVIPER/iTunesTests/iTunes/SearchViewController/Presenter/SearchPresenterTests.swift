//
//  SearchPresenterTests.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsVIPER

final class SearchPresenterTests: XCTestCase {
    private var presenter: SearchPresenter!
    private var mockView: MockSearchView!
    private var mockInteractor: MockSearchInteractor!
    private var mockRouter: MockSearchRouter!

    override func setUp() {
        super.setUp()
        mockView = MockSearchView()
        mockInteractor = MockSearchInteractor()
        mockRouter = MockSearchRouter()
        presenter = SearchPresenter(interactor: mockInteractor, router: mockRouter)
        presenter.view = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }

    func test_GivenSearchTerm_WhenDidTypeSearch_ThenInteractorSearchAlbumsIsCalled() {
        // Given
        let term = "DidTypeSearch"

        // When
        presenter.didTypeSearch(term)

        // Then
        XCTAssertEqual(mockInteractor.searchAlbumsArgsTerms.first, term)
        XCTAssertEqual(mockInteractor.searchAlbumsCallCount, 1)
    }

    func test_GivenSearchTerm_WhenSearchButtonClicked_ThenInteractorSearchAlbumsAndSaveSearchTermAreCalled() {
        // Given
        let term = "SearchButtonClicked"

        // When
        presenter.searchButtonClicked(with: term)

        // Then
        XCTAssertEqual(mockInteractor.searchAlbumsArgsTerms.first, term)
        XCTAssertEqual(mockInteractor.saveSearchTermArgsTerms.first, term)
        XCTAssertEqual(mockInteractor.searchAlbumsCallCount, 1)
    }

    func test_GivenHistoryTerm_WhenSearchFromHistory_ThenInteractorSearchAlbumsIsCalled() {
        // Given
        let term = "SearchFromHistory"

        // When
        presenter.searchFromHistory(with: term)

        // Then
        XCTAssertEqual(mockInteractor.searchAlbumsArgsTerms.first, term)
        XCTAssertEqual(mockInteractor.searchAlbumsCallCount, 1)
    }

    func test_GivenAlbum_WhenDidSelectAlbum_ThenRouterNavigatesToAlbumDetails() {
        // Given
        let album = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
        )

        // When
        presenter.didSelectAlbum(album)

        // Then
        XCTAssertEqual(mockRouter.navigateToAlbumDetailsCallCount, 1)
        XCTAssertEqual(mockRouter.navigateToAlbumDetailsArgsAlbums.first, album)
    }

    func test_GivenFetchedAlbums_WhenDidFetchAlbums_ThenViewUpdateAlbumsIsCalled() {
        // Given
        let albums = [
            Album(artistId: 111051,
                  artistName: "Eminem",
                  collectionName: "The Eminem Show",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 10.99
                 ),
            Album(artistId: 20044,
                  artistName: "Eminem",
                  collectionName: "Levitating",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 9.99
                 )
        ]

        // When
        presenter.didFetchAlbums(albums)

        // Then
        XCTAssertEqual(mockView.updateAlbumsCallCount, 1)
        XCTAssertEqual(mockView.updateAlbumsArgsAlbums.first, albums)
    }

    func test_GivenErrorMessage_WhenDidFailToFetchAlbums_ThenViewShowErrorIsCalled() {
        // Given
        let errorMessage = "Error Message"

        // When
        presenter.didFailToFetchAlbums(errorMessage)

        // Then
        XCTAssertEqual(mockView.showErrorCallCount, 1)
        XCTAssertEqual(mockView.showErrorArgsMessages.first, errorMessage)
    }
}
