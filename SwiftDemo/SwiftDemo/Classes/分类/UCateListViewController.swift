//
//  UCateListViewController.swift
//  SwiftDemo
//
//  Created by biwen song on 2020/7/28.
//  Copyright © 2020 biwen song. All rights reserved.
//

import UIKit
import MJRefresh

class UCateListViewController: UViewController {

    private var rankList = [RankingModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        
        ApiProvider.request(UApi.cateList, model: CateListModel.self) { (returnData) in
            self.rankList = returnData?.rankingList ?? []
            self.collectionView.reloadData()
            self.collectionView.mj_header?.endRefreshing()
        }
    }
    
    override func configueUI() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { (maker) in
            maker.left.equalToSuperview().offset(5)
            maker.right.equalToSuperview().offset(-5)
            maker.top.bottom.equalToSuperview()
        }
        
    }

    // MARK: - UI
    private lazy var collectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.autoresizingMask = [.flexibleHeight]
        collectionView.register(UINib.init(nibName: "URankCCell", bundle: nil), forCellWithReuseIdentifier: "URankCCell")
        collectionView.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            self.loadData()
        })
        return collectionView
    }()

    private lazy var ColumnCount:CGFloat = {
       return 3
    }()
}


extension UCateListViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rankList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "URankCCell", for: indexPath) as! URankCCell
        cell.model = rankList[indexPath.item]
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    //MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = floor((ScreenWidth - 10)/ColumnCount)
        let picWidth = width - 10
        let height = picWidth * 0.75 + 30
        return CGSize(width: width, height: height)
    }
    
}
