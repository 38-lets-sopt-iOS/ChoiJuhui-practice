//
//  ItemCollectionViewCell.swift
//  Seminar-Practice
//
//  Created by h2e on 4/30/26.
//

import UIKit

import SnapKit
import Then

protocol ItemCollectionViewCellDelegate: AnyObject {
    func heartButtonDidTap(cell: ItemCollectionViewCell)
}

final class ItemCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ItemCollectionViewCell"
    
    weak var delegate: ItemCollectionViewCellDelegate?
    
    private let itemImageView = UIImageView()
    private let nameLabel = UILabel()
    private let priceLabel = UILabel()
    let heartButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUI()
        setStyle()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [itemImageView, nameLabel, priceLabel, heartButton].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setStyle() {
        nameLabel.do {
            $0.textColor = .black
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 16)
        }
        
        priceLabel.do {
            $0.textColor = .orange
            $0.textAlignment = .left
            $0.font = .boldSystemFont(ofSize: 15)
        }
        
        heartButton.do {
            $0.setImage(.heartBlack, for: .normal)
            $0.setImage(.heartRed, for: .selected)
            $0.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        itemImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(9)
            $0.bottom.equalToSuperview().inset(59)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(itemImageView.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(2)
            $0.leading.equalToSuperview().offset(9)
        }
        
        heartButton.snp.makeConstraints {
            $0.trailing.bottom.equalTo(itemImageView).inset(8)
            $0.size.equalTo(16)
        }
    }
}

extension ItemCollectionViewCell {
    func dataBind(_ itemData: ItemModel){
        itemImageView.image = itemData.itemImg
        nameLabel.text = itemData.name
        priceLabel.text = itemData.price
        heartButton.isSelected = itemData.heartIsSelected
    }
    
    @objc
    private func heartButtonDidTap(){
        delegate?.heartButtonDidTap(cell: self)
    }
}
