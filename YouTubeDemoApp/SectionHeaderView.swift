//
//  SectionHeaderView.swift
//  YouTubeDemoApp
//
//  Created by Jimit Shah on 10/14/17.
//  Copyright © 2017 Jimit Shah. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
  @IBOutlet weak var titleLabel: UILabel!
  
  var title: String? {
    didSet {
      titleLabel.text = title
    }
  }
}
