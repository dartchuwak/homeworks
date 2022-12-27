//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 28.11.2022.
//

import UIKit


class ProfileHeaderView: UIView, UITextFieldDelegate {
    
        
   
    
    let imagePhoto = UIImage(named: "image")
    
    var avatarHeight: NSLayoutConstraint!
    var avatarWidth: NSLayoutConstraint!
    var avatarLeading: NSLayoutConstraint!
    var avatarTop: NSLayoutConstraint!
    var avatarCenterX: NSLayoutConstraint!
    var avatarCenterY: NSLayoutConstraint!
    
    var viewHeight: NSLayoutConstraint!
    var viewWidth: NSLayoutConstraint!
        
    let profileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cyan
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        return image
    }()
    
    let dumbProfileImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        image.clipsToBounds = true
        image.alpha = 0
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
    
    let blur: UIVisualEffectView = {
        let blur = UIBlurEffect(style: .regular)
        let blurView = UIVisualEffectView(effect: blur)
        blurView.frame = UIScreen.main.bounds
        blurView.alpha = 0
        return blurView
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(white: 0.90, alpha: 1)
        self.statusTextField.delegate = self
        addSubviews()
        profileImage.image = imagePhoto
        subviewsLayout()
        animationObjectsLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        self.addSubview(headerLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(button)
        self.addSubview(dumbProfileImage)
        self.addSubview(blur)
        self.addSubview(profileImage)
    }
    
    private func subviewsLayout(){
        NSLayoutConstraint.activate([
            dumbProfileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            dumbProfileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            dumbProfileImage.widthAnchor.constraint(equalToConstant: 100),
            dumbProfileImage.widthAnchor.constraint(equalToConstant: 100),
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            headerLabel.leadingAnchor.constraint(equalTo: dumbProfileImage.trailingAnchor, constant: 16),
            headerLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 16),
            statusLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 34),
            statusLabel.leadingAnchor.constraint(equalTo:  dumbProfileImage.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            statusTextField.leadingAnchor.constraint(equalTo: dumbProfileImage.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -16),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        ])
    }
    
    private func animationObjectsLayout() {
        avatarWidth = profileImage.widthAnchor.constraint(equalToConstant: 100)
        avatarWidth.isActive = true
        avatarHeight = profileImage.heightAnchor.constraint(equalToConstant: 100)
        avatarHeight.isActive = true
        avatarLeading = profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        avatarLeading.isActive = true
        avatarTop = profileImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        avatarTop.isActive = true
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
    
    @objc func tapped(_ tapRecognizer: UITapGestureRecognizer) {
        print("Hello World")
    }
}




