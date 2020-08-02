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
        view.backgroundColor = UIColor.red
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        guard let navi = navigationController as? UNavigationController else {return}
        navi.barStyle(.clear)
        navi.title = ""
    }

    private lazy var tableView:UITableView = {
        let tabView = UITableView(frame: .zero, style: .grouped)
        tabView.delegate = self
        tabView.dataSource = self
        return tabView
    }()

}

extension MyVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
