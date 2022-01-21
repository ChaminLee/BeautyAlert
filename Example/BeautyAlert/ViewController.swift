//
//  ViewController.swift
//  BeautyAlert
//
//  Created by ChaminLee on 01/21/2022.
//  Copyright (c) 2022 ChaminLee. All rights reserved.
//

import UIKit
import BeautyAlert

class ViewController: UIViewController {
    private let presentButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.addTarget(self, action: #selector(presentBeautyAlert), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Beauty Alert
    @objc private func presentBeautyAlert() {
        let beautyAlert = BeautyAlert()
        beautyAlert.setAttribute(title: "Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸Not Enough Money 💸", titleColor: .black, backgroundColor: .white, buttonType: .all)
        beautyAlert.setBackgroundShadow(style: .rightBottom)
        beautyAlert.setButtonAttribute(cancelTitle: "Cancel", confirmTitle: "OK", titleColor: .white, backgroundColor: .black)
        self.present(beautyAlert, animated: true, completion: nil)
    }

    private func configUI() {
        self.view.addSubview(presentButton)
        presentButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            presentButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            presentButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}

