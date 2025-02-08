//
//  AlbumRouterProtocol.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 08.02.2025.
//

import Foundation
import UIKit

protocol AlbumRouterProtocol: AnyObject {
    static func createModule(with album: Album) -> UIViewController
}
