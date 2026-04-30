//
//  LoginViewController_AutoLayout.swift
//  Sopt38-Seminar
//
//  Created by h2e on 4/11/26.
//

import UIKit

class LoginViewController_AutoLayout: UIViewController {
    
    var id: String? = nil
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.placeholder = "비밀번호"
        textField.font = .boldSystemFont(ofSize: 14)
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 3
        return textField
    }()

    private let idTextField : UITextField = {
            let textField = UITextField()
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
            textField.leftViewMode = .always
            textField.placeholder = "아이디"
            textField.font = .boldSystemFont(ofSize: 14)
        textField.backgroundColor = .grey200
            textField.layer.cornerRadius = 3
            return textField
        }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .primaryOrange
        button.setTitle("로그인하기", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(loginButtonDidTapped), for: .touchUpInside)
        button.layer.cornerRadius = 3
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    private func setUI(){
        [titleLabel, idTextField, passwordTextField, loginButton].forEach{self.view.addSubview($0)}
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setLayout(){
        NSLayoutConstraint.activate([titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 169)])
        
        NSLayoutConstraint.activate([idTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 63),
            idTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            idTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            idTextField.heightAnchor.constraint(equalToConstant: 52)])
        
        NSLayoutConstraint.activate([passwordTextField.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 7),
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52)])
        
        NSLayoutConstraint.activate([loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 128),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 57)])
    }
        
    @objc
    private func loginButtonDidTapped() {
        pushToWelcomeVC()
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.id = idTextField.text
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
        
}
