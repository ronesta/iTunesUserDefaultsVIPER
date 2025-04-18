//
//  MockAlbumInteractor.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 18.04.2025.
//

import UIKit.UIImage
@testable import iTunesUserDefaultsVIPER

final class MockAlbumInteractor: AlbumInteractorInputProtocol {
    private(set) var receivedAlbum: Album?
    
    func loadAlbumDetails(for album: Album) {
        receivedAlbum = album
    }
}
