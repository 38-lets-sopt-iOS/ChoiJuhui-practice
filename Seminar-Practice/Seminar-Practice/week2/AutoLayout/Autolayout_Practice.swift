//
//  Autolayout_Practice.swift
//  Sopt38-Seminar
//
//  Created by h2e on 4/11/26.
//

import UIKit

class Autolayout_Practice: UIViewController {
    
    private let yellowView = UIView()
    private let greenView = UIView()
    private let blackView = UIView()
    private let blueView = UIView()
    
    private func setUI(){
        view.backgroundColor = .white
        
        yellowView.backgroundColor = .yellow
        greenView.backgroundColor = .green
        blackView.backgroundColor = .black
        blueView.backgroundColor = .blue
        
        [yellowView, greenView, blackView, blueView].forEach{self.view.addSubview($0)}
        
        yellowView.translatesAutoresizingMaskIntoConstraints = false
        greenView.translatesAutoresizingMaskIntoConstraints = false
        blackView.translatesAutoresizingMaskIntoConstraints = false
        blueView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setlayout(){

        NSLayoutConstraint.activate([
            yellowView.topAnchor.constraint(equalTo: view.topAnchor),
            yellowView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            yellowView.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            yellowView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        ])
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: yellowView.bottomAnchor),
            greenView.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        ])
        
        
        NSLayoutConstraint.activate([
            blueView.topAnchor.constraint(equalTo: blackView.bottomAnchor),
            blueView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blueView.leadingAnchor.constraint(equalTo: view.centerXAnchor),
            blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            blueView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        ])
        
        NSLayoutConstraint.activate([
            blackView.topAnchor.constraint(equalTo: view.centerYAnchor),
            blackView.bottomAnchor.constraint(equalTo: blueView.topAnchor),
            blackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blackView.trailingAnchor.constraint(equalTo: view.centerXAnchor),
            blackView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)
        ])
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setlayout()
        }
}
