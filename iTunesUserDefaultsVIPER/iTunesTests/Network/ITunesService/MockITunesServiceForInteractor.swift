//
//  MockITunesServiceForInteractor.swift
//  iTunesTests
//
//  Created by Ибрагим Габибли on 16.04.2025.
//

import Foundation
@testable import iTunesUserDefaultsVIPER

final class MockITunesServiceForInteractor: ITunesServiceProtocol {
    private(set) var shouldReturnError = false
    private(set) var albumName: String?
    var albums = [Album]()

    func loadAlbums(albumName: String, completion: @escaping (Result<[Album], Error>) -> Void) {
        if shouldReturnError {
            let error = NSError(domain: "Test", code: 0, userInfo: nil)
            completion(.failure(error))
        } else {
            self.albumName = albumName
            completion(.success(albums))
        }
    }
}
