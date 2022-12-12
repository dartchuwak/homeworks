//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 28.11.2022.
//

import UIKit


class ProfileHeaderView: UIView, UITextFieldDelegate {
    
    let imagePhoto = UIImage(named: "image")
    
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cyan
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        image.clipsToBounds = true
        return image
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show status", for: .normal)
        button.titleLabel?.textAlignment = .center
        button.layer.cornerRadius = 4
        button.backgroundColor = .systemBlue
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 18)
        label.text = "Evgenii Mikhailov"
        label.textAlignment = .left
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.tintColor = .gray
        label.textColor = .gray
        label.text = "My status could be here..."
        label.textAlignment = .left
        return label
    }()
    
    let statusTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.black.cgColor
        tf.backgroundColor = .white
        tf.font = .systemFont(ofSize: 15)
        tf.borderStyle = .roundedRect
        tf.layer.cornerRadius = 15
        tf.clipsToBounds = true
        tf.placeholder = "My new status"
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0.90, alpha: 1)
        self.statusTextField.delegate = self
        addSubviews()
        profileImage.image = imagePhoto
        subviewsLayout()
        button.addTarget(self, action: #selector (buttonPressed), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(profileImage)
        self.addSubview(headerLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(button)
    }
    
    private func subviewsLayout(){
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            headerLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            statusLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 34),
            statusLabel.leadingAnchor.constraint(equalTo:  profileImage.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
    @objc private func buttonPressed() {
        print(statusLabel.text ?? "")
        if statusTextField.text != nil && statusTextField.text != "" {
            statusLabel.text = statusTextField.text
        } else { return }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusTextField.endEditing(true)
        if statusTextField.text != nil && statusTextField.text != "" {
            statusLabel.text = statusTextField.text
        }
        return false
    }
}




