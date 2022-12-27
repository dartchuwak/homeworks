//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    let profileView = ProfileHeaderView()
    
    let size = UIScreen.main.bounds.width
    
    
    let closeButton: UIButton = {
        let button = UIButton(frame: .zero)
        let image = UIImage(systemName: "xmark.circle")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        return button
    }()
    
    
    
    let postTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(white: 0.90, alpha: 1)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderTopPadding = 0
        tableView.sectionFooterHeight = 0
        return tableView
    }()
    
    let postCellId = "PostCellId"
    let photosCellId = "PhotosCellId"
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(white: 0.90, alpha: 1)
        self.navigationController?.navigationBar.isHidden = false
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: postCellId)
        postTableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photosCellId)
        view.addSubview(postTableView)
        postTableView.delegate = self
        postTableView.dataSource = self
        view.addSubview(closeButton)
        layoutTableView()
        closeButton.addTarget(self, action: #selector(close), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(onTap))
        profileView.profileImage.addGestureRecognizer(tap)
    }
    
    
    
    
    private func layoutTableView() {
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            postTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            postTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
        ])
    }
    
    @objc private func onTap( _ selector: UIGestureRecognizer) {
        profileView.avatarTop.isActive = false
        profileView.avatarLeading.isActive = false
        profileView.avatarHeight.constant = size
        profileView.avatarWidth.constant = size
        profileView.avatarCenterX = profileView.profileImage.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        profileView.avatarCenterX.isActive = true
        profileView.avatarCenterY = profileView.profileImage.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        profileView.avatarCenterY.isActive = true
        self.postTableView.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.5 ,delay: 0, options: [.curveEaseIn]) {
            self.view.layoutIfNeeded()
            self.profileView.blur.alpha = 1
        }
        
        UIView.animate(withDuration: 0.3 ,delay: 0.5, options: []) {
            self.closeButton.alpha = 1
            
        }
    }
    
    @objc private func close() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut]) {
            self.profileView.avatarCenterY.isActive = false
            self.profileView.avatarCenterX.isActive = false
            self.profileView.avatarTop.isActive = true
            self.profileView.avatarLeading.isActive = true
            self.profileView.avatarHeight.constant = 100
            self.profileView.avatarWidth.constant = 100
            self.closeButton.alpha = 0
            self.profileView.blur.alpha = 0
            self.postTableView.isUserInteractionEnabled = true
            self.view.layoutIfNeeded()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return posts.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let photosCell = tableView.dequeueReusableCell(withIdentifier: photosCellId) as! PhotosTableViewCell
            return photosCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: postCellId) as! PostTableViewCell
            let post = posts[indexPath.row]
            cell.authorLabel.text = post.author
            cell.image.image = UIImage(named: post.image)
            cell.desctiptionLabel.text = post.description
            cell.likesCount.text = String(post.likes)
            cell.viewsCount.text = String(post.views)
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return profileView
        } else {
            return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print(indexPath)
            self.navigationController?.pushViewController(PhotosViewController(), animated: true)
        }
    }
}


