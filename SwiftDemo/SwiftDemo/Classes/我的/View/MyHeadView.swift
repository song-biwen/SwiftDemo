//
//  MyHeadView.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/7/30.
//  Copyright © 2020 biwen song. All rights reserved.
//

import UIKit
import SnapKit

class MyHeadView: UIView {
    
    lazy var bgImgView:UIImageView = {
        let bgImgView = UIImageView()
        bgImgView.contentMode = .scaleAspectFill
        return bgImgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configUI() {
        addSubview(bgImgView)
        bgImgView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        bgImgView.image = UIImage(named: "mine_bg_for_girl")
    }
}
