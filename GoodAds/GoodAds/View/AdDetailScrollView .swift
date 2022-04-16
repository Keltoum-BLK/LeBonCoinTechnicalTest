//
//  ScrollView .swift
//  GoodAds
//
//  Created by Kel_Jellysh on 14/04/2022.
//

import Foundation
import UIKit

class AdDetailScrollView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    weak var delegate: AdActionsView?
    lazy var scrollView = UIScrollView()
    lazy var contentView = UIView()
    
    lazy var adImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var closeBTN: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame.size = CGSize(width: 50, height: 50)
        btn.setImage(UIImage(named: "close.png"), for: .normal)
        btn.addTarget(self, action: #selector(closeControllerButtonAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc func closeControllerButtonAction() {
        delegate?.dismissAdViewController()
    }
}

extension AdDetailScrollView {
    
    //MARK: UIConstraints
    func setupScrollView() {
        backgroundColor = .white
        addSubview(adImage)
        addSubview(scrollView)
        addSubview(closeBTN)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
      }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor),
            scrollView.topAnchor.constraint(equalTo: adImage.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            adImage.widthAnchor.constraint(equalTo: widthAnchor),
            adImage.topAnchor.constraint(equalTo: topAnchor),
            adImage.heightAnchor.constraint(equalTo:heightAnchor,multiplier: 0.35),
            adImage.leadingAnchor.constraint(equalTo:leadingAnchor),
            adImage.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            closeBTN.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            closeBTN.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
}
    

