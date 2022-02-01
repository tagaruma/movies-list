//
//  MovieDetailsViewController.swift
//  HusqvarnaTest
//
//  Created by Ruslan Garifulin on 2022-01-30.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    var viewModel: MovieDetailsViewModel

    private lazy var titleView: DoubleLabelView = {
        var view = DoubleLabelView(title: "Title")
        view.translatesAutoresizingMaskIntoConstraints = false
        viewModel.data.bind(\.originalTitle, to: view, \.text)

        return view
    }()

    private lazy var taglineView: DoubleLabelView = {
        var view = DoubleLabelView(title: "Tagline")
        view.translatesAutoresizingMaskIntoConstraints = false
        viewModel.data.bind(\.tagline, to: view, \.text)

        return view
    }()

    private lazy var runtimeView: DoubleLabelView = {
        var view = DoubleLabelView(title: "Runtime")
        view.translatesAutoresizingMaskIntoConstraints = false
        viewModel.data.bind(\.runtime, to: view, \.text)

        return view
    }()

    private lazy var statusView: DoubleLabelView = {
        var view = DoubleLabelView(title: "Status")
        view.translatesAutoresizingMaskIntoConstraints = false
        viewModel.data.bind(\.status, to: view, \.text)

        return view
    }()

    private lazy var releaseDateView: DoubleLabelView = {
        var view = DoubleLabelView(title: "Release Date")
        view.translatesAutoresizingMaskIntoConstraints = false
        viewModel.data.bind(\.releaseDate, to: view, \.text)

        return view
    }()

    private lazy var budgetView: DoubleLabelView = {
        var view = DoubleLabelView(title: "Budget")
        view.translatesAutoresizingMaskIntoConstraints = false
        viewModel.data.bind(\.budget, to: view, \.text)

        return view
    }()

    private lazy var revenueView: DoubleLabelView = {
        var view = DoubleLabelView(title: "Revenue")
        view.translatesAutoresizingMaskIntoConstraints = false
        viewModel.data.bind(\.revenue, to: view, \.text)

        return view
    }()

    // MARK: - Init

    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        viewModel.data.bind(\.title, to: self, \.title)
        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(titleView)
        view.addSubview(taglineView)
        view.addSubview(runtimeView)
        view.addSubview(statusView)
        view.addSubview(releaseDateView)
        view.addSubview(budgetView)
        view.addSubview(revenueView)

        NSLayoutConstraint.activate([titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                                     titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     titleView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                                     taglineView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
                                     taglineView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     taglineView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                                     runtimeView.topAnchor.constraint(equalTo: taglineView.bottomAnchor),
                                     runtimeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     runtimeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                                     statusView.topAnchor.constraint(equalTo: runtimeView.bottomAnchor),
                                     statusView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     statusView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                                     releaseDateView.topAnchor.constraint(equalTo: statusView.bottomAnchor),
                                     releaseDateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     releaseDateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                                     budgetView.topAnchor.constraint(equalTo: releaseDateView.bottomAnchor),
                                     budgetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     budgetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

                                     revenueView.topAnchor.constraint(equalTo: budgetView.bottomAnchor),
                                     revenueView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     revenueView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}
