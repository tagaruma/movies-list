//
//  DoubleLabelView.swift
//  HusqvarnaTest
//
//  Created by Ruslan Garifulin on 2022-02-01.
//

import UIKit

class DoubleLabelView: UIView {
    var text: String? {
        didSet {
            textLabel.text = text
        }
    }

    private let title: String

    private lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18.0, weight: .bold)
        label.text = title

        return label
    }()

    private lazy var textLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18.0)

        return label
    }()

    init(title: String) {
        self.title = title

        super.init(frame: .zero)

        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        addSubview(titleLabel)
        addSubview(textLabel)

        NSLayoutConstraint.activate([heightAnchor.constraint(greaterThanOrEqualToConstant: 30.0),
                                     titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
                                     titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10.0),
                                     titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10.0),
                                     textLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
                                     textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10.0),
                                     textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10.0)])
    }
}
