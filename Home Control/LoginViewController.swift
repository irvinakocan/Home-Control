//
//  ViewController.swift
//  Home Control
//
//  Created by Macbook Air 2017 on 13. 6. 2023..
//

import UIKit

class LoginViewController: UIViewController {
    
    let lblLogin: UILabel = {
        let label = UILabel()
        label.text = "LOG IN"
        label.textColor = .black
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    let lblUsername: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.textColor = .black
        return label
    }()
    
    let txtUsername: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Username"
        txtField.autocapitalizationType = .none
        return txtField
    }()
    
    let lblPassword: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.textColor = .black
        return label
    }()
    
    let txtPassword: UITextField = {
        let txtField = UITextField()
        txtField.isSecureTextEntry = true
        txtField.text = "@@@@"
        return txtField
    }()
    
    let lblRememberMe: UILabel = {
        let label = UILabel()
        label.text = "Keep Me Log in"
        label.textColor = .lightGray
        return label
    }()
    
    let swKeepLogin: UISwitch = {
        let sw = UISwitch()
        return sw
    }()
    
    lazy var keepLoginStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.addArrangedSubview(lblRememberMe)
        stack.addArrangedSubview(swKeepLogin)
        return stack
    }()
    
    let btnLogin: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 5
        button.backgroundColor = .blue
        button.setTitle("Log in", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button
    }()

    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20.0
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        [
            self.lblUsername,
            self.txtUsername,
            self.lblPassword,
            self.txtPassword,
            self.keepLoginStackView,
            self.btnLogin
        ].forEach({
            stack.addArrangedSubview($0)
        })
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
    }
    
    func setupUI() {
        view.addSubview(lblLogin)
        lblLogin.translatesAutoresizingMaskIntoConstraints = false
        lblLogin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        lblLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        lblLogin.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        btnLogin.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: lblLogin.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: lblLogin.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: lblLogin.bottomAnchor, constant: 30).isActive = true
    }
    
    @objc func btnLoginTapped() {
        
    }
}

