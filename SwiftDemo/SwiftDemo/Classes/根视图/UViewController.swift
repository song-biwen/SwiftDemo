//
//  UViewController.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/7/16.
//  Copyright © 2020 biwen song. All rights reserved.
//

import UIKit

class UViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 242, green: 242, blue: 242, alpha: 1.0)
        configueUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }
    
    func configueUI()  {}
    
    func configNavigationBar() {
        
        guard let navi = navigationController else {return}
        if navi.visibleViewController == self {
//            navi.navigationBar.barStyle = .black
            navi.navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navi.navigationBar.shadowImage = UIImage()
        }
    }

}
