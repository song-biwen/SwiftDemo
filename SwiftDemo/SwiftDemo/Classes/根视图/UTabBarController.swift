//
//  UTabBarController.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/7/16.
//  Copyright © 2020 biwen song. All rights reserved.
//

import UIKit

class UTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configueUI()
        
        tabBar.isTranslucent = false
    }
    
    func configueUI() {
        
        //首页
        let homeVC = UHomeViewController()
        addChildViewController(childVC: homeVC, title: "首页", image: UIImage(named: "tab_home"), selectedImage: UIImage(named: "tab_home_S"))
        
        //分类
        let cateVC = UCateListViewController()
        addChildViewController(childVC: cateVC, title: "分类", image: UIImage(named: "tab_class"), selectedImage: UIImage(named: "tab_class_S"))
        
        //书架
        let bookVC = UBookViewController()
        addChildViewController(childVC: bookVC, title: "书架", image: UIImage(named: "tab_book"), selectedImage: UIImage(named: "tab_book_S"))
        
        //我的
        let myVC = MyVC()
        addChildViewController(childVC: myVC, title: "我的", image: UIImage(named: "tab_mine"), selectedImage: UIImage(named: "tab_mine_S"))
    }
    
    
    func addChildViewController(childVC:UViewController, title: String?, image: UIImage?, selectedImage: UIImage?) {
        
        childVC.navigationController?.title = title
        childVC.title = title
        childVC.tabBarItem = UITabBarItem(title: nil, image: image?.withRenderingMode(.alwaysOriginal), selectedImage: selectedImage?.withRenderingMode(.alwaysOriginal))
        if (UIDevice.current.userInterfaceIdiom == .phone) {
            childVC.tabBarItem.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        }
        
        let nav = UNavigationController(rootViewController: childVC)
        addChild(nav)
        
    }

}

extension UTabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let selectedVC = selectedViewController else {
            return .lightContent
        }
        
        return selectedVC.preferredStatusBarStyle
    }
}
