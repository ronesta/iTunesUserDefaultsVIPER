//
//  AlbumInteractorTests.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 18.04.2025.
//

import XCTest
@testable import iTunesUserDefaultsVIPER

final class AlbumInteractorTests: XCTestCase {
    private var interactor: AlbumInteractor!
    private var mockPresenter: MockAlbumPresenter!
    private var mockImageLoader: MockImageLoader!

    override func setUp() {
        super.setUp()
        mockPresenter = MockAlbumPresenter()
        mockImageLoader = MockImageLoader()
        interactor = AlbumInteractor(imageLoader: mockImageLoader)
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        mockImageLoader = nil
        super.tearDown()
    }

    func testLoadAlbumDetailsCallsPresenterWithData() {
        let mockAlbum = Album(artistId: 111051,
                          artistName: "Eminem",
                          collectionName: "The Eminem Show",
                          artworkUrl100: "url_to_image",
                          collectionPrice: 10.99
                         )
        let mockImage = UIImage(systemName: "checkmark.diamond")

        mockImageLoader.mockImage = mockImage
        interactor.loadAlbumDetails(for: mockAlbum)

        XCTAssertEqual(mockPresenter.receivedAlbum, mockAlbum)
        XCTAssertTrue(mockPresenter.receivedImage === mockImage)
    }
}
