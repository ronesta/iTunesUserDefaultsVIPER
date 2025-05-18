//
//  AlbumPresenterTests.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 18.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsVIPER

final class AlbumPresenterTests: XCTestCase {
    private var presenter: AlbumPresenter!
    private var mockView: MockAlbumView!
    private var mockInteractor: MockAlbumInteractor!
    private var mockAlbum: Album!

    override func setUp() {
        super.setUp()
        mockAlbum = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
        )
        mockInteractor = MockAlbumInteractor()
        presenter = AlbumPresenter(interactor: mockInteractor, album: mockAlbum)
        mockView = MockAlbumView()
        presenter.view = mockView
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockInteractor = nil
        mockAlbum = nil
        super.tearDown()
    }

    func test_GivenPresenter_WhenViewDidLoad_ThenCallsInteractorWithAlbum() {
        // Given presenter

        // When
        presenter.viewDidLoad()

        // Then
        XCTAssertEqual(mockInteractor.loadAlbumDetailsArgsAlbums.first, mockAlbum)
    }

    func test_GivenPresenter_WhenDidFetchAlbumDetails_ThenDisplaysAlbumOnView() {
        // Given
        let image = UIImage()

        // When
        presenter.didFetchAlbumDetails(album: mockAlbum, image: image)

        // Then
        XCTAssertEqual(mockView.displayAlbumDetailsCallCount, 1)
        XCTAssertEqual(mockView.displayAlbumDetailsArgsAlbums.first, mockAlbum)
        XCTAssertEqual(mockView.displayAlbumDetailsArgsImages.first, image)
    }
}
