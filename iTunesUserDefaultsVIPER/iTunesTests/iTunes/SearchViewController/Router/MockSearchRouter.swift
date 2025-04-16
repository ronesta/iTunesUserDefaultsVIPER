//
//  MockSearchRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockSearchRouter: SearchRouterProtocol {
    private(set) var navigatedAlbum: Album?

    func navigateToAlbumDetails(with album: Album) {
        navigatedAlbum = album
    }
}
