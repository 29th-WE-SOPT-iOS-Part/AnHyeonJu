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
    
    var homeContentList: [HomeContentData] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initHomeContentList()
        registerXib()
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
    
    // MARK: - Custom Method
    func registerXib() {
        let xibName = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        homeTableView.register(xibName, forCellReuseIdentifier: HomeTableViewCell.identifier)        
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

}

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