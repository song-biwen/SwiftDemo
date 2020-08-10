//
//  URankCCell.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/8/10.
//  Copyright © 2020 biwen song. All rights reserved.
//

import UIKit
import Kingfisher

class URankCCell: UICollectionViewCell {

    @IBOutlet weak var myCView: UIView!//内容
    @IBOutlet weak var picImageView: UIImageView!//图片
    @IBOutlet weak var nameLabel: UILabel!//名称
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        myCView.layer.borderWidth = 1
        myCView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        myCView.layer.masksToBounds = true
        myCView.layer.cornerRadius = 5
    }

    var model:RankingModel? {
        didSet {
            guard let model = model else {return}
            nameLabel.text = model.sortName
            picImageView.kf.setImage(with: URL(string: model.cover ?? ""))
        }
    }
    
}
