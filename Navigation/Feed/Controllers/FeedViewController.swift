//
//  FeedViewController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import UIKit


class FeedViewController: UIViewController {
    
    //let post = Post(title: "Make Love Not War")
    	
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(createButton())
    }
    
    func createButton() -> UIButton {
        let button = UIButton ()
        button.bounds = CGRect(x: 0, y: 0, width: 150, height: 35)
        button.center.x = view.center.x
        button.center.y = view.center.y + 150
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        button.setTitle("Show me post", for: .normal)
        button.addTarget(self, action: #selector (goToPostButtonPressed), for: .touchUpInside)
        return button
    }
    
    @objc func goToPostButtonPressed() {
        let vc = PostViewController()
        //vc.title = post.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
