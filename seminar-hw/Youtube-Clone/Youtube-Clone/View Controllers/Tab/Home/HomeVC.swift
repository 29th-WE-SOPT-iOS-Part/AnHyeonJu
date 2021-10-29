//
//  OrangeVC.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/10/15.
//

import UIKit

class HomeVC: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var homeTableView: UITableView!
    @IBOutlet weak var shortsCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    private var homeContentList: [HomeContentData] = []
    private var shortsCollectionContentList: [ShortsCollectionContentData] = []
    private var categoryList = [String]()

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeContentList()
        initHomeCollectionContentList()
        initCategoryCollectionContentList()
        registerXib()
        homeTableView.dataSource = self
        homeTableView.delegate = self
        shortsCollectionView.dataSource = self
        shortsCollectionView.delegate = self
    }
    
    // MARK: - Custom Method
    func registerXib() {
        let xibName = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        homeTableView.register(xibName, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
//        let xibName = UINib(nibName: ShortsCollectionViewCell.identifier, bundle: nil)
//        homeTableView.register(xibName, forCellReuseIdentifier: HomeTableViewCell.identifier)
//
//        let xibName = UINib(nibName: HomeCategoryViewCell.identifier, bundle: nil)
//        homeTableView.register(xibName, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
    }
    
    
    func initHomeContentList() {
        homeContentList.append(contentsOf: [
            HomeContentData(titleName: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환"),
            HomeContentData(titleName: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController"),
            HomeContentData(titleName: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView"),
            HomeContentData(titleName: "4차 iOS 세미나 : Cocoapods & Networking, REST API"),
            HomeContentData(titleName: "5차 iOS 세미나 : 디자인 합동 세미나"),
            HomeContentData(titleName: "6차 iOS 세미나 : 서버 합동 세미나 + 솝커톤"),
            HomeContentData(titleName: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화"),
            HomeContentData(titleName: "8차 iOS 세미나 : 협업 시 도움이 되는 팁과 라이브러리 사용")
        ])
    }
    
    func initHomeCollectionContentList() {
        shortsCollectionContentList.append(contentsOf: [
            ShortsCollectionContentData(shortsImageName: "ggamju1", shortsTitleName: "iOSPart"),
            ShortsCollectionContentData(shortsImageName: "ggamju2", shortsTitleName: "AndroidPart"),
            ShortsCollectionContentData(shortsImageName: "ggamju3", shortsTitleName: "ServerPart"),
            ShortsCollectionContentData(shortsImageName: "ggamju4", shortsTitleName: "WebPart"),
            ShortsCollectionContentData(shortsImageName: "ggamju5", shortsTitleName: "DesignPart"),
            ShortsCollectionContentData(shortsImageName: "ggamju6", shortsTitleName: "PlanPart"),
            ShortsCollectionContentData(shortsImageName: "ggamju7", shortsTitleName: "DesignPart"),
            ShortsCollectionContentData(shortsImageName: "ggamju8", shortsTitleName: "DesignPart")
        ])
    }
    
    func initCategoryCollectionContentList() {
        categoryList.append(contentsOf: ["전체","오늘","이어서 시청하기","시청하지 않음","실시간","게시물"])
    }
    
}

// MARK: - Extension
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 306
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeContentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier) as? HomeTableViewCell else {return UITableViewCell()}
        
        cell.setData(rank: indexPath.row, appData: homeContentList[indexPath.row])
        return cell
    }
}

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shortsCollectionContentList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortsCollectionViewCell.identifier, for: indexPath) as? ShortsCollectionViewCell else {return UICollectionViewCell()}
        
        cell.setData(appName: shortsCollectionContentList[indexPath.row].shortsTitleName, appImage: shortsCollectionContentList[indexPath.row].makeImage())
        return cell
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:72, height: 104)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
