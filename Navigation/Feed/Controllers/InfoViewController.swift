//
//  InfoViewController.swift
//  Navigation
//
//  Created by Evgenii Mikhailov on 22.11.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(createButton())
        self.title = "INFO"
    }
    
    func createButton() -> UIButton {
        let button = UIButton ()
        button.bounds = CGRect(x: 0, y: 0, width: 150, height: 35)
        button.center.x = view.center.x
        button.center.y = view.center.y + 150
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 10
        button.setTitle("Show Alert", for: .normal)
        button.addTarget(self, action: #selector (showAlertButtonPressed), for: .touchUpInside)
        return button
    }
    
    @objc func showAlertButtonPressed() {
        createAlertController()
    }
    
    func createAlertController() {
        let alert = UIAlertController(title: "For your information", message: "Please, make love not war", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in print ("OK button pressed") }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in self.dismiss(animated: true)}
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true)
    }
}
