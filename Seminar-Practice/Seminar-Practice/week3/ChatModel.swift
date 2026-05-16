//
//  ChatModel.swift
//  Seminar-Practice
//
//  Created by h2e on 4/30/26.
//

import UIKit

struct ChatModel {
    let profileImg: UIImage
    let name: String
    let place: String
    let message: String
    let itemImg: UIImage
    
}

extension ChatModel {
    static func dummy() -> [ChatModel] {
        return [
            ChatModel(profileImg: .profile1, name: "이나연", place: "공덕", message: "내말에답장해줘", itemImg: .product1),
            ChatModel(profileImg: .profile2, name: "김수민", place: "돌곶이", message: "로봇안만듭니다", itemImg: .product2),
            ChatModel(profileImg: .profile3, name: "이상엽", place: "별내", message: "나는야경기도민", itemImg: .product3),
            ChatModel(profileImg: .profile4, name: "김경택", place: "용산", message: "저거 혹시 얼마에 파시나요?", itemImg: .product4),
            ChatModel(profileImg: .profile1, name: "김세령", place: "미국", message: "답장이 너무 늦었죠", itemImg: .product5),
            ChatModel(profileImg: .profile2, name: "정교은", place: "중국", message: "네고해주세요!!", itemImg: .product6),
            ChatModel(profileImg: .profile3, name: "이승희", place: "일본", message: "네고안됩니다", itemImg: .product7),
            ChatModel(profileImg: .profile4, name: "임성환", place: "태국", message: "네.", itemImg: .product1),
            ChatModel(profileImg: .profile1, name: "장지인", place: "명왕성", message: "나 아요 아기", itemImg: .product2),
            ChatModel(profileImg: .profile2, name: "신서연", place: "안드로메다", message: "수고하세용", itemImg: .product3),
            ChatModel(profileImg: .profile3, name: "이서영", place: "뭘보슈", message: "집에갈래", itemImg: .product4),
            ChatModel(profileImg: .profile4, name: "최주희", place: "흠", message: "얍얍", itemImg: .product1),
            ChatModel(profileImg: .profile4, name: "진소은", place: "인천", message: "어제쓱이이김ㅋㅋㅅㄱ", itemImg: .product2)
        ]
    }
}
