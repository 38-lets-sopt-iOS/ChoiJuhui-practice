//
//  ModificationViewController.swift
//  Seminar-Practice
//
//  Created by h2e on 5/4/26.
//

import UIKit

import SnapKit
import Then

class ModificationViewController: UIViewController {
    var userId: Int = 0
    
    private let loginIdTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.borderStyle = .roundedRect
        $0.isUserInteractionEnabled = false
        $0.backgroundColor = .lightGray
    }
    
    private let nameTextField = UITextField().then {
        $0.placeholder = "이름"
        $0.borderStyle = .roundedRect
    }
    
    private let emailTextField = UITextField().then {
        $0.placeholder = "이메일"
        $0.borderStyle = .roundedRect
        $0.autocapitalizationType = .none
        $0.keyboardType = .emailAddress
    }
    
    private let ageTextField = UITextField().then {
        $0.placeholder = "나이"
        $0.borderStyle = .roundedRect
        $0.keyboardType = .numberPad
    }
    
    private let partTextField = UITextField().then {
        $0.placeholder = "파트"
        $0.borderStyle = .roundedRect
        $0.isUserInteractionEnabled = false
        $0.backgroundColor = .lightGray
    }
    
    private let modifyButton = UIButton().then {
        $0.setTitle("수정하기", for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 10
        $0.setTitleColor(.white, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
        setAddTarget()
        
        loadUserInfo()
    }
    
    // 조회
    
    private func loadUserInfo() {
        Task {
            do {
                let response = try await ModificationAPIService.shared.getUserInfo(userId: userId)
                
                if response.success, let user = response.data {
                    bindUserInfo(user)
                } else {
                    showAlert(title: "조회 실패", message: response.message)
                }
            } catch {
                showAlert(title: "조회 실패", message: error.localizedDescription)
                print("조회 실패", error)
            }
        }
    }
    
    private func bindUserInfo(_ user: UserInfoData) {
        loginIdTextField.text = user.loginId
        nameTextField.text = user.name
        emailTextField.text = user.email
        ageTextField.text = "\(user.age)"
        partTextField.text = user.part
    }
    
    // 수정
    
    @objc private func modifyButtonDidTap() {
        let name = nameTextField.text?.isEmpty == false ? nameTextField.text : nil
        let email = emailTextField.text?.isEmpty == false ? emailTextField.text : nil
        let age = Int(ageTextField.text ?? "")
        
        Task{
            do {
                let response = try await ModificationAPIService.shared.patchModification(userId: userId,
                                        name: name,
                                        email: email,
                                        age: age)
                
                if response.success, let updatedUser = response.data {
                    bindUserInfo(updatedUser)
                    showAlert(title: "수정 성공", message: response.message)
                    
                } else {
                    showAlert(title: "수정 실패", message: response.message)
                }
            } catch {
                showAlert(title: "수정 실패", message: error.localizedDescription)
                print("수정 실패", error)
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated:true)
    }
    
    private func setUI() {
        view.addSubviews(loginIdTextField, nameTextField, emailTextField, ageTextField, partTextField, modifyButton)
    }
    
    private func setLayout() {
        loginIdTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
            }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(loginIdTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        emailTextField.snp.makeConstraints{
            $0.top.equalTo(nameTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        ageTextField.snp.makeConstraints{
            $0.top.equalTo(emailTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        partTextField.snp.makeConstraints {
            $0.top.equalTo(ageTextField.snp.bottom).offset(20)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        modifyButton.snp.makeConstraints {
            $0.top.equalTo(partTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    private func setAddTarget() {
        modifyButton.addTarget(self, action: #selector(modifyButtonDidTap), for: .touchUpInside)
    }
}
