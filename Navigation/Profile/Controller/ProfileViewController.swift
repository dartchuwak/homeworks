//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    
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
        layoutTableView()
    }
    
    
    private func layoutTableView() {
        NSLayoutConstraint.activate([
            postTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            postTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            postTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            postTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
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
           // let photo = photos[indexPath.row]
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
            return ProfileHeaderView()
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


