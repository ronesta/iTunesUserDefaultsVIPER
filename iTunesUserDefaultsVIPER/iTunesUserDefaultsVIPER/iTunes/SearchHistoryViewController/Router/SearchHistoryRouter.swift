//
//  SearchHistoryRouter.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 05.02.2025.
//

import Foundation
import UIKit

final class SearchHistoryRouter: SearchHistoryRouterProtocol {
    weak var viewController: UIViewController?

    func performSearch(with term: String) {
        let searchAssembler = SearchAssembly()

        guard let searchViewController = searchAssembler.createModule() as? UINavigationController,
              let rootViewController = searchViewController.viewControllers.first as? SearchViewController else {
            return
        }

        rootViewController.performSearch(with: term)

        viewController?.navigationController?.pushViewController(rootViewController, animated: true)
    }
}
