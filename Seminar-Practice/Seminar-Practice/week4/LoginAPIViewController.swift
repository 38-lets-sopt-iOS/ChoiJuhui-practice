//
//  LoginAPIViewController.swift
//  Seminar-Practice
//
//  Created by h2e on 5/2/26.
//

import UIKit

import SnapKit
import Then

class LoginAPIViewController: UIViewController {
    private let idTextField = UITextField()
    private let passwordTextField = UITextField()
    private lazy var signinButton = UIButton()
    
    private var id: String = ""
    private var password: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setStyle()
        setAddTarget()
    }
    
    private func setUI() {
        view.addSubviews(
                idTextField, passwordTextField, signinButton
            )
        }
        
    private func setStyle() {
        view.backgroundColor = .white
        
        let placeholder = ["아이디", "비밀번호"]
        
        [idTextField, passwordTextField]
            .enumerated()
            .forEach { index, textField in
                textField.do {
                    $0.placeholder = placeholder[index]
                    $0.borderStyle = .roundedRect
                    $0.autocapitalizationType = .none
                    $0.autocorrectionType = .no
                    $0.spellCheckingType = .no
                }
                
                signinButton.do {
                    $0.setTitle("로그인", for: .normal)
                    $0.backgroundColor = .systemBlue
                    $0.layer.cornerRadius = 10
                }
            }
    }
    
    private func setLayout() {
        idTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(300)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        signinButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        [idTextField,passwordTextField].forEach {
            $0.addTarget(self, action: #selector(textFieldDidEditingChanged(_:)), for: .editingChanged)
        }
        signinButton.addTarget(self, action: #selector(loginButtonDidTap), for: .touchUpInside)
    }
}

extension LoginAPIViewController {
    @objc
    private func textFieldDidEditingChanged(_ textField: UITextField) {
        switch textField {
        case idTextField:
            id = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            return
        }
    }
    
    @objc
    private func loginButtonDidTap() {
        Task {
            do {
                let response = try await LoginAPIService.shared.postsignin(
                    loginId: id,
                    password: password
                )
                
                if response.success, let userId = response.data?.userId {
                    print("로그인 성공, userId: \(userId)")
                    self.navigationController?.pushViewController(
                        ModificationViewController(),
                        animated: true
                    )
                } else {
                    showAlert(title: "로그인 실패", message: response.message)
                    print("로그인 실패: \(response.message)")
                }
            } catch {
                showAlert(title: "로그인 실패", message: error.localizedDescription)
                print("로그인 실패", error)
            }
        }
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
