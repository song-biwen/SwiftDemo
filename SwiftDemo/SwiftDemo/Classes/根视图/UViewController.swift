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
        view.backgroundColor = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
        
        if #available(iOS 11.0, *) {
            UIScrollView.appearance().contentInsetAdjustmentBehavior = .never
        }else {
            automaticallyAdjustsScrollViewInsets = false
        }
        configueUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }
    
    func configueUI()  {}
    
    func configNavigationBar() {
        
        guard let navi = navigationController as? UNavigationController else {return}
        if navi.visibleViewController == self {
            
            navi.barStyle(UNavigationBarStyle.theme)
            navi.disablePopGesture = false
//            navi.setNavigationBarHidden(false, animated: true)
            navi.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20)]
            if navi.viewControllers.count > 1 {
                navi.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_white"), style: .done, target: self, action: #selector(pressBack))
            }
        }
    }
    
    @objc func pressBack() {
        navigationController?.popViewController(animated: true)
    }
}

extension UViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
