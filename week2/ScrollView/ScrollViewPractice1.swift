//
//  ScrollViewPractice1.swift
//  Sopt38-Seminar
//
//  Created by h2e on 4/12/26.
//

import UIKit
import SnapKit

class ScrollViewPractice1: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let greenView = UIView()
    private let blueView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        greenView.backgroundColor = .green
        blueView.backgroundColor = .blue
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [greenView, blueView].forEach { contentView.addSubview($0) }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(scrollView.contentLayoutGuide)
            $0.width.equalTo(scrollView.frameLayoutGuide)
            $0.height.greaterThanOrEqualToSuperview().priority(.low)
        }
                
        greenView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(800)
        }
                
        blueView.snp.makeConstraints {
            $0.top.equalTo(greenView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(800)
            $0.bottom.equalToSuperview()
        }

        
    }
}
