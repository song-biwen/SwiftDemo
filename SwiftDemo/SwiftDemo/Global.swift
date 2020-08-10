//
//  Global.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/7/30.
//  Copyright © 2020 biwen song. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit


let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height

extension UIColor {
    class var background: UIColor {
        return UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
    }
    
    class var theme: UIColor {
        return UIColor(red: 29/255.0, green: 221/255.0, blue: 43/255.0, alpha: 1.0)
    }
}

var topVC: UIViewController? {
    var resultVC: UIViewController?
    resultVC = _topVC(UIApplication.shared.keyWindow?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC
}

var isIphoneX: Bool {
    return UI_USER_INTERFACE_IDIOM() == .phone
        && (max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 812
        || max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 896)
}

private  func _topVC(_ vc: UIViewController?) -> UIViewController? {
    if vc is UINavigationController {
        return _topVC((vc as? UINavigationController)?.topViewController)
    } else if vc is UITabBarController {
        return _topVC((vc as? UITabBarController)?.selectedViewController)
    } else {
        return vc
    }
}

extension ConstraintView {
    var usnp:ConstraintBasicAttributesDSL {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.snp
        }else {
            return self.snp
        }
    }
}

extension UICollectionView {
    func reloadData(animation:Bool = true) {
        if animation {
            reloadData()
        }else {
            UIView.performWithoutAnimation {
                reloadData()
            }
        }
    }
}

