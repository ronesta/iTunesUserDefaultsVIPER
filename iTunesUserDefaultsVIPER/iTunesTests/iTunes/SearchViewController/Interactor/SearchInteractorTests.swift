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
    private var mockITunesService: MockITunesServiceForInteractor!
    private var mockStorageManager: MockStorageManager!
    private var mockPresenter: MockSearchPresenter!

    override func setUp() {
        super.setUp()
        mockITunesService = MockITunesServiceForInteractor()
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

    func testSearchAlbumsWithSavedAlbums() {
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
        interactor.searchAlbums(with: term)

        let savedAlbums = mockStorageManager.loadAlbums(for: term)
        XCTAssertEqual(savedAlbums, albums)

        XCTAssertEqual(mockPresenter.fetchedAlbums, albums)
    }

    func testSearchAlbumsWithNewAlbums() {
        let term = "Eminem"

        let albums = [
            Album(artistId: 111051,
                  artistName: "Eminem",
                  collectionName: "The Eminem Show",
                  artworkUrl100: "url_to_image",
                  collectionPrice: 10.99
                 )
        ]

        mockITunesService.albums = albums

        interactor.searchAlbums(with: term)

        XCTAssertEqual(mockPresenter.fetchedAlbums, albums)
        XCTAssertNil(mockPresenter.failedError)

        let savedAlbums = mockStorageManager.loadAlbums(for: term)
        XCTAssertEqual(savedAlbums, albums)
    }

    func testSearchAlbumsHandlesServiceError() {
        let term = "Timati"
        mockITunesService.shouldReturnError = true

        interactor.searchAlbums(with: term)

        XCTAssertNotNil(mockPresenter.failedError)
    }
}
