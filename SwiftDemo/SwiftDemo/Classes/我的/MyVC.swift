//
//  MyVC.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/7/16.
//  Copyright © 2020 biwen song. All rights reserved.
//

import UIKit

class MyVC: UViewController {

    private lazy var myArray: Array = {
        return [[["icon":"mine_vip", "title": "我的VIP"],
                 ["icon":"mine_coin", "title": "充值妖气币"]],
            
                [["icon":"mine_accout", "title": "消费记录"],
                 ["icon":"mine_subscript", "title": "我的订阅"],
                 ["icon":"mine_seal", "title": "我的封印图"]],
                
                [["icon":"mine_message", "title": "我的消息/优惠券"],
                 ["icon":"mine_cashew", "title": "妖果商城"],
                 ["icon":"mine_freed", "title": "在线阅读免流量"]],
                
                [["icon":"mine_feedBack", "title": "帮助中心"],
                 ["icon":"mine_mail", "title": "我要反馈"],
                 ["icon":"mine_judge", "title": "给我们评分"],
                 ["icon":"mine_author", "title": "成为作者"],
                 ["icon":"mine_setting", "title": "设置"]]]
    }()
    
    private lazy var headerView:MyHeadView = {
         return MyHeadView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 200));
    }()
    
    private lazy var navigationBarY:CGFloat = {
        return navigationController?.navigationBar.frame.maxY ?? 0
    }()
    
    private lazy var statusBarY:CGFloat = {
        return 44
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
    }
    
    override func configNavigationBar() {
        super.configNavigationBar()
        guard let navi = navigationController as? UNavigationController else {return}
        navi.barStyle(.clear)
        navigationItem.title = ""
    }

    override func configueUI() {
        super.configueUI()
        view.addSubview(tableView)
        tableView.tableHeaderView = headerView
        tableView.snp.makeConstraints { (maker) in
            maker.left.right.bottom.equalToSuperview()
            maker.top.equalToSuperview().offset(-navigationBarY - statusBarY)
        }
        
    }
    
    private lazy var tableView:UITableView = {
        let tabView = UITableView(frame: .zero, style: .grouped)
        tabView.delegate = self
        tabView.dataSource = self
        tabView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "MyCell")
        tabView.tableFooterView = UIView()
        tabView.rowHeight = UITableView.automaticDimension
        tabView.separatorStyle = .none
        return tabView
    }()
    

}

extension MyVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let sectionArray = myArray[section]
        
        return sectionArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sectionArray = myArray[indexPath.section]
        let dic = sectionArray[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MyCell;
        cell.picImgV.image = UIImage(named: dic["icon"]!)
        cell.txLab.text = dic["title"]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionArray = myArray[indexPath.section]
        let item = sectionArray[indexPath.row]
        print("\(item)")
    }
}
