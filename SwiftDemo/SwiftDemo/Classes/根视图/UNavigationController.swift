//
//  UNavigationController.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/7/16.
//  Copyright © 2020 biwen song. All rights reserved.
//

import UIKit

class UNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let interactionGes = interactivePopGestureRecognizer else {return}
        guard let targetView = interactionGes.view else {return}
        guard let internalTargets = interactionGes.value(forKeyPath: "targets") as? [NSObject] else {return}
        guard let internalTargert = internalTargets.first?.value(forKeyPath: "target") else {return}
        let action = Selector(("handleNavigationTransition:"))
        
        
        let fullScreenGes = UIPanGestureRecognizer(target: internalTargert, action: action)
        fullScreenGes.delegate = self
        targetView.addGestureRecognizer(fullScreenGes)
        interactionGes.isEnabled = false
        
        
        
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
}


extension UNavigationController:UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        let isLeftToRight = UIApplication.shared.userInterfaceLayoutDirection == .leftToRight
        guard let ges = gestureRecognizer as? UIPanGestureRecognizer else {return true}
        if ges.translation(in: gestureRecognizer.view).x * (isLeftToRight ? 1 : -1) <= 0 {
            return false
        }
        
        return viewControllers.count != 1
        
    }
}

extension UNavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        guard let topVC = topViewController else {return .lightContent}
        return topVC.preferredStatusBarStyle
    }
}


enum UNavigationBarStyle {
    case theme
    case clear
    case white
}

extension UNavigationController {
    private struct AssociatedKeys {
        static var disablePopGesture: Void?
    }
    
    var disablePopGesture:Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.disablePopGesture) as? Bool ?? false
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.disablePopGesture, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func barStyle(_ style:UNavigationBarStyle) {
        switch style {
        case .theme:
            navigationBar.barStyle = .black
            navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), for: .default)
            navigationBar.shadowImage = UIImage()
        case .clear:
           navigationBar.barStyle = .black
           navigationBar.setBackgroundImage(UIImage(), for: .default)
           navigationBar.shadowImage = UIImage()
        case .white:
            navigationBar.barStyle = .default
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = nil
        }
    }
    
}
