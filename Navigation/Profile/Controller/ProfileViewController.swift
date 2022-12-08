//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    let profileHeadView = ProfileHeaderView()
    
    let postTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)
        return tableView
    }()
    
    let cellId = "CellId"
    
    override func viewDidLoad() {
        view.backgroundColor = UIColor(white: 0.95, alpha: 1)
        // self.navigationController?.navigationBar.isHidden = false
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellId)
        view.addSubview(postTableView)
        postTableView.rowHeight = UITableView.automaticDimension
        postTableView.delegate = self
        postTableView.dataSource = self
        layoutTableView()
        createPosts()
        
    }
    
    private func layoutTableView() {
        NSLayoutConstraint.activate([
            postTableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            postTableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            postTableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            postTableView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PostTableViewCell
        let post = posts[indexPath.row]
        cell.authorLabel.text = post.author
        cell.image.image = UIImage(named: post.image)
        cell.desctiptionLabel.text = post.description
        cell.likesCount.text = String(post.likes)
        cell.viewsCount.text = String(post.views)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return profileHeadView
        
    }
}


