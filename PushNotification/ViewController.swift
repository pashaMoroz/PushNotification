//
//  ViewController.swift
//  PushNotification
//
//  Created by Pavel Moroz on 20.09.2020.
//  Copyright © 2020 Pavel Moroz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        label.translatesAutoresizingMaskIntoConstraints = false

        label.backgroundColor = .red
        label.text = "dafawfaw"

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        //label.text = UserDefaults.standard.string(forKey: "testKey")
        view.backgroundColor = .orange
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)

       // print(UserDefaults.standard.string(forKey: "testKey"))
        DispatchQueue.main.asyncAfter(wallDeadline: .now()+3) {
            self.label.text = UserDefaults.standard.string(forKey: "testKey")
        }

    }

}

