//
//  MoviesListViewController.swift
//  HusqvarnaTest
//
//  Created by Ruslan Garifulin on 2022-01-30.
//

import UIKit

class MoviesListViewController: UIViewController {
    private let viewTitle = "Movies list"

    private var viewModel: MoviesListProtocol

    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ItemTableViewCell.self, forCellReuseIdentifier: String(describing: ItemTableViewCell.self))
        tableView.estimatedRowHeight = UIScreen.main.bounds.width * 1.3
        tableView.rowHeight = UIScreen.main.bounds.width * 1.3
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self

        return tableView
    }()

    init(viewModel: MoviesListProtocol = MoviesListViewModel()) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)

        self.viewModel.onMoviesFetched = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        title = viewTitle
        setupSubviews()
        viewModel.fetchMovies()
    }

    private func setupSubviews() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }

    private func openMovieDetails(at index: Int) {
        let id = viewModel.getMovieID(at: index)
        let viewModel = MovieDetailsViewModel(id: id)

        let viewController = MovieDetailsViewController(viewModel: viewModel)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension MoviesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openMovieDetails(at: indexPath.row)
    }

//    Don't need to fetch next page so for now. Uncomment when needed.
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == viewModel.numberOfRows - 1 {
//            viewModel.fetchMovies()
//        }
//    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = String(describing: ItemTableViewCell.self)

        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ItemTableViewCell else {
            fatalError("Could not dequeque table view cell")
        }

        let url = viewModel.getPosterURL(at: indexPath.row)
        cell.update(with: url)

        return cell
    }
}
