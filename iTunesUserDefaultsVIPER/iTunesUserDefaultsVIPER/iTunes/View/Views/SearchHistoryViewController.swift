//
//  SearchHistoryViewController.swift
//  iTunesUserDefaultsVIPER
//
//  Created by Ибрагим Габибли on 03.02.2025.
//

import UIKit

final class SearchHistoryViewController: UIViewController {
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .singleLine
        return tableView
    }()

    var presenter: SearchHistoryPresenterProtocol?
    var tableViewDataSource: SearchHistoryDataSourceProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupViews()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.loadSearchHistory()
    }

    private func setupNavigationBar() {
        title = "History"
    }

    private func setupViews() {
        view.addSubview(tableView)
        view.backgroundColor = .systemGray6

        tableView.dataSource = tableViewDataSource
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

// MARK: - SearchHistoryViewProtocol
extension SearchHistoryViewController: SearchHistoryViewProtocol {
    func updateSearchHistory(_ history: [String]) {
        tableViewDataSource?.searchHistory = history
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDelegate
extension SearchHistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let selectedTerm = tableViewDataSource?.searchHistory[indexPath.row] else {
            return
        }

        performSearch(for: selectedTerm)
    }

    func performSearch(for term: String) {
        let searchHistoryViewController = SearchHistoryRouter()
        searchHistoryViewController.navigateBackToSearchWithTerm(with: term, from: self.navigationController)
    }
}
