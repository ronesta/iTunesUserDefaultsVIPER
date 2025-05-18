//
//  SearchInteractorTests.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsVIPER

final class SearchInteractorTests: XCTestCase {
    private var interactor: SearchInteractor!
    private var mockITunesService: MockITunesService!
    private var mockStorageManager: MockStorageManager!
    private var mockPresenter: MockSearchPresenter!

    override func setUp() {
        super.setUp()
        mockITunesService = MockITunesService()
        mockStorageManager = MockStorageManager()
        mockPresenter = MockSearchPresenter()
        interactor = SearchInteractor(
            iTunesService: mockITunesService,
            storageManager: mockStorageManager
        )
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockITunesService = nil
        mockStorageManager = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testSaveSearchTerm() {
        let term = "SomeAlbum"
        interactor.saveSearchTerm(term)

        XCTAssertTrue(mockStorageManager.searchHistory.contains(term))
    }

    func test_GivenSavedAlbums_WhenSearchAlbums_ThenAlbumsAreDisplayedFromStorage() {
        // Given
        let term = "SavedAlbums"
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

        mockStorageManager.saveAlbums(albums, for: term)

        // When
        interactor.searchAlbums(with: term)

        // Then
        let savedAlbums = mockStorageManager.loadAlbums(for: term)
        XCTAssertEqual(savedAlbums, albums)
        XCTAssertEqual(mockPresenter.didFetchAlbumsCallCount, 1)
        XCTAssertEqual(mockPresenter.didFetchAlbumsArgs.first, albums)
    }

    func test_GivenNewAlbums_WhenSearchAlbums_ThenAlbumsAreFetchedAndDisplayed() {
        // Given
        let term = "Eminem"
        let albums = [
            Album(artistId: 111051,
                  artistName: "Eminem",
                  collectionName: "The Eminem Show",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 10.99
                 )
        ]

        mockITunesService.stubbedAlbumsResult = .success(albums)

        // When
        interactor.searchAlbums(with: term)

        // Then
        XCTAssertEqual(mockPresenter.didFetchAlbumsCallCount, 1)
        XCTAssertEqual(mockPresenter.didFetchAlbumsArgs.first, albums)
        XCTAssertEqual(mockPresenter.didFailToFetchAlbumsCallCount, 0)

        let savedAlbums = mockStorageManager.loadAlbums(for: term)
        XCTAssertEqual(savedAlbums, albums)
    }
}
