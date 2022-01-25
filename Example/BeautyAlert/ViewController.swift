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
    func confirmAction() {
        print("confirm")
    }
    
    func cancelAction() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func presentBeautyAlert() {
        let beautyAlert = BeautyAlert()
        beautyAlert.setContentAttribute(title: "Not Enough Money 💸", titleColor: .white, message: "you have to visit bank", messageColor: .lightGray, backgroundColor: .black)
        beautyAlert.setContentShadowDirection(style: .rightBottom)
        beautyAlert.addButton(title: "Cancel", titleColor: .black, backgroundColor: .lightGray, style: .cancel, action: cancelAction)
        beautyAlert.addButton(title: "OK", titleColor: .black, backgroundColor: .white, style: .confirm, action: confirmAction)
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

