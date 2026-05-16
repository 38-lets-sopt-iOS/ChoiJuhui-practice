//
//  UIView+.swift
//  Seminar-Practice
//
//  Created by h2e on 5/2/26.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach{self.addSubview($0)}
    }
}
