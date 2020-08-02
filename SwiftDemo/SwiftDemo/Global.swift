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

var topVC:UIViewController? {
    
    var resultVC:UIViewController?
    resultVC = _top(UIApplication.shared.keyWindow?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _top(resultVC?.presentedViewController)
    }
    return resultVC
}

var isIphoneX:Bool {
    return UI_USER_INTERFACE_IDIOM() == .phone && (max(ScreenWidth, ScreenHeight) == 812 || max(ScreenWidth, ScreenHeight) == 896)
}

private func _top(_ vc:UIViewController?) -> UIViewController? {
    
    if vc is UNavigationController {
        return _top((vc as? UNavigationController)?.topViewController)
    }
    else if vc is UTabBarController {
        return _top((vc as? UTabBarController)?.selectedViewController)
    }
    else {
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

