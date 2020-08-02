//
//  MyCell.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/8/2.
//  Copyright © 2020 biwen song. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var picImgV: UIImageView!//图片
    @IBOutlet weak var txLab: UILabel!//内容
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
