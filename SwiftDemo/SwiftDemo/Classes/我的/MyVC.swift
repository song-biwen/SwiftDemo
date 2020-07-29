//
//  MyVC.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/7/16.
//  Copyright © 2020 biwen song. All rights reserved.
//

import UIKit

class MyVC: UViewController {

    let lineView = UIView()
    let screenWidth = UIScreen.main.bounds.size.width
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        navigationController?.title = "我的"
        view.backgroundColor = UIColor.cyan
        
        lineView.frame = CGRect(x: 0, y: 100, width: screenWidth, height: 100)
        lineView.backgroundColor = UIColor.clear
        view.addSubview(lineView)
        
        
        let leftTopShapeLayer = CAShapeLayer()
        leftTopShapeLayer.fillColor = UIColor.yellow.cgColor
        
        let leftTopPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 100, height: 100), byRoundingCorners: .topLeft, cornerRadii: CGSize(width: 50, height: 50))
        leftTopShapeLayer.path = leftTopPath.cgPath
        
        
        let rightTopShapeLayer = CAShapeLayer()
        rightTopShapeLayer.fillColor = UIColor.yellow.cgColor
        
        let rightTopPath = UIBezierPath(roundedRect: CGRect(x: 100, y: 0, width: screenWidth - 100, height: 100), byRoundingCorners: .topRight, cornerRadii: CGSize(width: 50, height: 50))
        rightTopShapeLayer.path = rightTopPath.cgPath
        
        lineView.layer.addSublayer(leftTopShapeLayer)
        lineView.layer.addSublayer(rightTopShapeLayer)
        
        
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
