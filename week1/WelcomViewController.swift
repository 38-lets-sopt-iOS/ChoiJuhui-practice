//
//  WelcomViewController.swift
//  Sopt38-Seminar
//
//  Created by h2e on 4/10/26.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var id: String? = nil
    
    private let welcomeImageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 120, y: 120, width: 150, height: 150))
        iv.image = UIImage(named: "당근마켓.png")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel(frame: CGRect(x:120, y: 295, width: 145, height: 60))
        label.text = "???님\n반가워요!"
        label.textAlignment = .center
        label.font = UIFont(name: "Pretendard-ExtraBold", size:20)
        label.numberOfLines = 2
        return label
    }()
    
    private let mainButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 426, width: 335, height: 57))
        button.backgroundColor = .primaryOrange
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.textColor = .white
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size:20)
        button.layer.cornerRadius = 3
        return button
    }()
    
    private let backToLoginButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 20, y: 498, width: 335, height: 57))
        button.backgroundColor = UIColor(red: 221/255, green: 222/255, blue: 227/255, alpha: 1)
        button.setTitle("다시 로그인", for: .normal)
        button.titleLabel?.textColor = .grey300
        button.titleLabel?.font = UIFont(name: "Pretendard-Bold", size:18)
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(backToLoginTapped), for: .touchUpInside)
        return button
    }()
    
    
    private func bindID() {
            if let id = id {
                welcomeLabel.text = "\(id)님\n반가워요!"
            } else {
                welcomeLabel.text = "??님\n반가워요!"
            }
        }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = .white
            self.navigationItem.hidesBackButton = true
            setLayout()
            bindID()
        }
    
    
    private func setLayout(){
        [welcomeImageView, welcomeLabel, mainButton, backToLoginButton].forEach{self.view.addSubview($0)}
    }
    
    @objc
    private func backToLoginTapped(){
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
