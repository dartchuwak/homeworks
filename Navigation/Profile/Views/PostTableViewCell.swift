//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 08.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    
    let authorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    let image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        return image
    }()
    
    let desctiptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()
    
    let likesStackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.translatesAutoresizingMaskIntoConstraints = false
        let likeImage = UIImageView(image: UIImage(systemName: "heart.fill"))
        sv.addArrangedSubview(likeImage)
        sv.spacing = 10
        return sv
    }()
    
    let viewsStackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.translatesAutoresizingMaskIntoConstraints = false
        let viewImage = UIImageView(image: UIImage(systemName: "eye"))
        sv.addArrangedSubview(viewImage)
        sv.spacing = 10
        return sv
    }()
    
    let likesCount: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    let viewsCount: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        fillStackView()
        layout()
    }
    
    private func fillStackView() {
        likesStackView.addArrangedSubview(likesCount)
        viewsStackView.addArrangedSubview(viewsCount)
    }
    
    private func addSubviews() {
        addSubview(authorLabel)
        addSubview(image)
        addSubview(desctiptionLabel)
        addSubview(likesStackView)
        addSubview(viewsStackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            authorLabel.widthAnchor.constraint(equalTo: self.widthAnchor),
            authorLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            authorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            image.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            desctiptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
            desctiptionLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
            desctiptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            likesStackView.topAnchor.constraint(equalTo: desctiptionLabel.bottomAnchor, constant: 16),
            likesStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            likesStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
            viewsStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant:  -16),
            viewsStackView.topAnchor.constraint(equalTo: desctiptionLabel.bottomAnchor ,constant: 16),
            viewsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
}
