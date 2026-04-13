//
//  LoginViewController.swift
//  Sopt38-Seminar
//
//  Created by h2e on 4/10/26.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let titleLabel : UILabel = {
        let label = UILabel(frame: CGRect(x : 73, y : 163, width: 236, height: 44))
        label.text = "동네라서 가능한 모든 것\n당근에서 가까운 이웃과 함께해요."
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let passwordTextField : UITextField = {
        let textField = UITextField(frame: CGRect(x: 20, y: 335, width: 335, height: 52))
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
        textField.leftViewMode = .always
        textField.placeholder = "비밀번호"
        textField.font = .boldSystemFont(ofSize: 14)
        textField.backgroundColor = .grey200
        textField.layer.cornerRadius = 3
        return textField
    }()

    private let idTextField : UITextField = {
            let textField = UITextField(frame: CGRect(x: 20, y: 277, width: 335, height: 52))
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 23, height: 0))
            textField.leftViewMode = .always
            textField.placeholder = "아이디"
            textField.font = .boldSystemFont(ofSize: 14)
        textField.backgroundColor = .grey200
            textField.layer.cornerRadius = 3
            return textField
        }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 422, width: 335, height: 52))
        button.backgroundColor = UIColor(red: 255/255, green: 111/255, blue: 15/255, alpha: 1)
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
        setLayout()
    }
    
    private func setLayout(){
        [titleLabel, idTextField, passwordTextField, loginButton].forEach{self.view.addSubview($0)}
    }
        
    @objc
    private func loginButtonDidTapped() {
        pushToWelcomeVC()
    }

    private func pushToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.configure(id: idTextField.text)
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    private func presentToWelcomeVC() {
        let welcomeViewController = WelcomeViewController()
        welcomeViewController.modalPresentationStyle = .formSheet
        welcomeViewController.configure(id: idTextField.text)
        self.present(welcomeViewController, animated: true)
    }
        
}
