//
//  AdImage.swift
//  GoodAds
//
//  Created by Kel_Jellysh on 14/04/2022.
//

import Foundation
import UIKit


class ImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: .zero)
        self.contentMode = .scaleAspectFill
        self.layer.masksToBounds = true
        self.tintColor = .systemOrange
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    convenience init(defaultImage: UIImage) {
        self.init(frame: .zero)
        self.image = defaultImage
    }
}

