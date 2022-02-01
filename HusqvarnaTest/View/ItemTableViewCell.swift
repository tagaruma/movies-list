//
//  ItemTableViewCell.swift
//  HusqvarnaTest
//
//  Created by Ruslan Garifulin on 2022-01-30.
//

import UIKit
import Kingfisher

class ItemTableViewCell: UITableViewCell {
    var movie: Movie?

    private lazy var shadowView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 1.0
        view.layer.shadowRadius = 5.0
        view.clipsToBounds = false

        return view
    }()

    private lazy var posterImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true

        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .none
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        contentView.addSubview(shadowView)
        shadowView.addSubview(posterImageView)

        NSLayoutConstraint.activate([
            shadowView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.0),
            shadowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15.0),
            shadowView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15.0),
            shadowView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0),

            posterImageView.leadingAnchor.constraint(equalTo: shadowView.leadingAnchor),
            posterImageView.topAnchor.constraint(equalTo: shadowView.topAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: shadowView.bottomAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: shadowView.trailingAnchor)
        ])
    }

    func update(with url: URL?) {
        posterImageView.kf.indicatorType = .activity
        posterImageView.kf.setImage(with: url, placeholder: UIImage(named: "placeholder"))
    }
}
