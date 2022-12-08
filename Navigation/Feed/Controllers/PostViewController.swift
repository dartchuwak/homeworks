//
//  PostViewController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import UIKit

class PostViewController: UIViewController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        createBarButton()
    }
    
    func createBarButton () {
        let infoButton = UIBarButtonItem(title: "Info", image: UIImage(systemName: "info.circle"), target: self, action: #selector(BarButtonPressed))
        self.navigationItem.rightBarButtonItem  = infoButton
    }
    
    @objc func BarButtonPressed() {
       let vc = InfoViewController()
       present(vc, animated: true)
    }
    
  
    
    
    
    
    
}

