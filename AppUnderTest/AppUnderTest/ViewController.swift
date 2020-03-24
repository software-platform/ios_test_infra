//
//  ViewController.swift
//  AppUnderTest
//
//  Created by Jaroslaw Gliwinski on 2020-03-24.
//  Copyright © 2020 Tooploox. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button: UIButton = {
        let button = UIButton()
        button.setTitle("BUTTON", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        button.addTarget(self, action: #selector(colorFestival), for: .touchUpInside)

        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func colorFestival() {
        button.setTitleColor(.systemGreen, for: .normal)
        button.setTitle("CLICKED", for: .normal)
    }
}

