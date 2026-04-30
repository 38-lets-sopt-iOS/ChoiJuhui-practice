//
//  ItemViewController.swift
//  Seminar-Practice
//
//  Created by h2e on 4/30/26.
//

import UIKit

import SnapKit

final class ItemViewController: UIViewController {
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    final let lineSpacing: CGFloat = 10
    final let interItemSpacing: CGFloat = 21
    final let cellHeight: CGFloat = 198
    final let inset = UIEdgeInsets(top: 49, left: 20, bottom: 10, right: 20)
    
    private var itemList = ItemModel.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray  // 회색 배경 확인용
        setUI()
        setLayout()
        //setCollectionViewLayout()
        setDelegate()
        register()
    }
    
    private func setUI() {
        self.view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - inset.left - inset.right - interItemSpacing
        let cellWidth = doubleCellWidth / 2
        
        flowLayout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        flowLayout.minimumLineSpacing = interItemSpacing
        flowLayout.minimumInteritemSpacing = interItemSpacing
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
    
    private func setDelegate() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func register() {
        collectionView.register(
            ItemCollectionViewCell.self,
            forCellWithReuseIdentifier: ItemCollectionViewCell.identifier
        )
    }
}

extension ItemViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - inset.left - inset.right - interItemSpacing
        return CGSize(width: doubleCellWidth / 2, height: 198)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return inset
    }
}

extension ItemViewController: UICollectionViewDelegate {}

extension ItemViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.identifier, for: indexPath) as? ItemCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.delegate = self
        cell.dataBind(itemList[indexPath.row])
        return cell
    }
}

extension ItemViewController: ItemCollectionViewCellDelegate {
    func heartButtonDidTap(cell: ItemCollectionViewCell) {
        guard let indexPath = collectionView.indexPath(for: cell) else { return }
        itemList[indexPath.item].heartIsSelected.toggle()
        cell.heartButton.isSelected.toggle()
    }
}
