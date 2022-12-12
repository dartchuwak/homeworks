//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 12.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let title: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.text =  "Photos"
        return label
    }()
    
    let arrow: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: "arrow.right"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.tintColor = .black
        return image
    }()
    
    
    let stackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.spacing = 8
        sv.alignment = .center
        sv.distribution = .equalCentering
        return sv
    }()
    
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .white
        self.selectionStyle = .none
        let imageOne = createImageViews(with: "1")
        let imageTwo = createImageViews(with: "2")
        let imageThree = createImageViews(with: "3")
        let imageFour = createImageViews(with: "4")
        stackView.addArrangedSubview(imageOne)
        stackView.addArrangedSubview(imageTwo)
        stackView.addArrangedSubview(imageThree)
        stackView.addArrangedSubview(imageFour)
        addSubview(stackView)
        addViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(title)
        addSubview(stackView)
        addSubview(arrow)
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            arrow.centerYAnchor.constraint(equalTo: title.centerYAnchor, constant: 0),
            arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    
   
    private func createImageViews(with name:String) -> UIImageView {
        let image = UIImageView(image: UIImage(named: name))
        image.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (48))/4).isActive = true
        image.heightAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width - (48))/4).isActive = true
        image.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }
    
    
 

}
