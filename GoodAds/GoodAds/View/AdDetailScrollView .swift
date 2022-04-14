//
//  ScrollView .swift
//  GoodAds
//
//  Created by Kel_Jellysh on 14/04/2022.
//

import Foundation
import UIKit

class AdDetailScrollView : UIView {
    
    lazy var scrollView = UIScrollView()
    lazy var contentView = UIView()
    
    func setupScrollView() {
          scrollView.translatesAutoresizingMaskIntoConstraints = false
          contentView.translatesAutoresizingMaskIntoConstraints = false
          self.addSubview(scrollView)
          scrollView.addSubview(contentView)
          scrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
          scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
          scrollView.topAnchor.constraint(equalTo: topAnchor).isActive = true
          scrollView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
          contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
          contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
          contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
          contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
      }
}
