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

    func testDidTypeSearchCallsInteractor() {
        let term = "DidTypeSearch"
        presenter.didTypeSearch(term)

        XCTAssertTrue(mockInteractor.searchQueries.contains(term))
        XCTAssertEqual(mockInteractor.searchQueries.count, 1)
    }

    func testSearchButtonClickedCallsInteractor() {
        let term = "SearchButtonClicked"
        presenter.searchButtonClicked(with: term)

        XCTAssertTrue(mockInteractor.searchQueries.contains(term))
        XCTAssertTrue(mockInteractor.searchHistory.contains(term))
        XCTAssertEqual(mockInteractor.searchQueries.count, 1)
    }

    func testSearchFromHistoryCallsInteractor() {
        let term = "SearchFromHistory"
        presenter.searchFromHistory(with: term)

        XCTAssertTrue(mockInteractor.searchQueries.contains(term))
        XCTAssertEqual(mockInteractor.searchQueries.count, 1)
    }

    func testDidSelectAlbum_navigatesToAlbumDetails() {
        let album = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
                         )

        presenter.didSelectAlbum(album)

        XCTAssertEqual(mockRouter.navigatedAlbum, album)
    }

    func testDidFetchAlbumsCallsViewUpdateAlbums() {
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

        presenter.didFetchAlbums(albums)

        XCTAssertEqual(mockView.albums, albums)
    }

    func test_didFailToFetchAlbums_callsViewShowError() {
        let errorMessage = "Error Message"

        presenter.didFailToFetchAlbums(errorMessage)

        XCTAssertEqual(mockView.errorMessage, errorMessage)
    }
}
