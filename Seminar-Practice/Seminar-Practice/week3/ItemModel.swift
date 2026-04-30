//
//  ItemModel.swift
//  Seminar-Practice
//
//  Created by h2e on 4/30/26.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .product1, name: "가나디", price: "1000", heartIsSelected: false),
            ItemModel(itemImg: .product2, name: "오쏘몰", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .product3, name: "애플워치", price: "3000", heartIsSelected: true),
            ItemModel(itemImg: .product4, name: "가방", price: "4000", heartIsSelected: false),
            ItemModel(itemImg: .product5, name: "헤드셋", price: "5000", heartIsSelected: false),
            ItemModel(itemImg: .product6, name: "틴트", price: "4000", heartIsSelected: false),
            ItemModel(itemImg: .product7, name: "카메라", price: "3000", heartIsSelected: false),
            ItemModel(itemImg: .product1, name: "로션", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .product2, name: "락스", price: "1000", heartIsSelected: false),
            ItemModel(itemImg: .product3, name: "가방", price: "2000", heartIsSelected: false),
            ItemModel(itemImg: .product4, name: "헤드셋", price: "3000", heartIsSelected: false),
            ItemModel(itemImg: .product5, name: "틴트", price: "4000", heartIsSelected: false)
        ]
    }
}
