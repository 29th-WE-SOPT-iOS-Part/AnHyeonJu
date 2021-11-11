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
    @IBOutlet weak var profileBtn: UIButton!
    
    var homeContentList: [HomeContentData] = []
    var shortsCollectionContentList: [ShortsCollectionContentData] = []
    var categoryList = [String]()

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataList()
        registerXib()
        makeDelegate()
    }
    
    
    //🌱 쌰라웃 투 듐보걸~ NavigationController에 VC을 따로 안만들고 class를 UINavigationController로, Storyboard ID만 MainNavi로 지정했답니다..!
    // MARK: - @IBAction
    @IBAction func touchUpToGoLoginView(_ sender: Any) {
        let loginStoryBoard = UIStoryboard.init(name:"Main", bundle: nil)
        guard let navi = loginStoryBoard.instantiateViewController(withIdentifier: "MainNavi") as? UINavigationController else {return}
        
        navi.modalPresentationStyle = .fullScreen
        self.present(navi, animated: true, completion: nil)
    }
    
    
    // MARK: - Custom Method
    func makeDelegate() {
        homeTableView.dataSource = self
        homeTableView.delegate = self
        shortsCollectionView.dataSource = self
        shortsCollectionView.delegate = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }
    
    func registerXib() {
        let xibName = UINib(nibName: HomeTableViewCell.identifier, bundle: nil)
        homeTableView.register(xibName, forCellReuseIdentifier: HomeTableViewCell.identifier)
        
        let shortsxibName = UINib(nibName: ShortsCollectionViewCell.identifier, bundle: nil)
        shortsCollectionView.register(shortsxibName, forCellWithReuseIdentifier: ShortsCollectionViewCell.identifier)

        let categoryxibName = UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil)
        categoryCollectionView.register(categoryxibName, forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        
    }
    
    func initDataList() {
        homeContentList.append(contentsOf: [
            HomeContentData(thumbNailImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", titleName: "1차 iOS 세미나 : iOS 컴포넌트 이해, Xcode 기본 사용법, View 화면전환", subTitleName: "WE SOPT ・ 10만뷰 ・ 3주"),
            HomeContentData(thumbNailImageName: "wesoptServerPart", profileImageName: "wesoptProfile", titleName: "2차 iOS 세미나 : AutoLayout, StackView, TabBarController", subTitleName: "WE SOPT ・ 50만뷰 ・ 5주"),
            HomeContentData(thumbNailImageName: "wesoptDesignPart", profileImageName: "wesoptProfile", titleName: "3차 iOS 세미나 : ScrollView, Delegate Pattern, TableView, CollectionView", subTitleName: "WE SOPT ・ 30만뷰 ・ 1주"),
            HomeContentData(thumbNailImageName: "wesoptWebPart", profileImageName: "wesoptProfile", titleName: "4차 iOS 세미나 : Cocoapods & Networking, REST API", subTitleName: "WE SOPT ・ 1만뷰 ・ 5주"),
            HomeContentData(thumbNailImageName: "wesoptPlanPart", profileImageName: "wesoptProfile", titleName: "5차 iOS 세미나 : 디자인 합동 세미나", subTitleName: "WE SOPT ・ 3만뷰 ・ 5주"),
            HomeContentData(thumbNailImageName: "wesoptAndroidPart", profileImageName: "wesoptProfile", titleName: "6차 iOS 세미나 : 서버 합동 세미나 + 솝커톤", subTitleName: "WE SOPT ・ 200만뷰 ・ 4주"),
            HomeContentData(thumbNailImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", titleName: "7차 iOS 세미나 : Animation과 제스쳐, 데이터 전달 심화", subTitleName: "WE SOPT ・ 30만뷰 ・ 8주"),
            HomeContentData(thumbNailImageName: "wesoptiOSPart", profileImageName: "wesoptProfile", titleName: "8차 iOS 세미나 : 협업 시 도움이 되는 팁과 라이브러리 사용", subTitleName: "WE SOPT ・ 40만뷰 ・ 7주")
        ])
        
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

        categoryList.append(contentsOf: [
            "전체","오늘","이어서 시청하기","시청하지 않음","실시간","게시물"
        ])
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
        switch collectionView {
        case shortsCollectionView:
            return shortsCollectionContentList.count
        case categoryCollectionView:
            return categoryList.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case shortsCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShortsCollectionViewCell.identifier, for: indexPath) as? ShortsCollectionViewCell else {return UICollectionViewCell()}
            
            cell.setData(appName: shortsCollectionContentList[indexPath.row].shortsTitleName, appImage: shortsCollectionContentList[indexPath.row].makeImage())
            return cell
        case categoryCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as? CategoryCollectionViewCell else {return UICollectionViewCell()}
            
            cell.setData(categoryText: categoryList[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case shortsCollectionView:
            return CGSize(width: 72, height: 104)
        case categoryCollectionView:
            return CGSize(width: categoryList[indexPath.item].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14)]).width + 20, height: 32)
        default:
            return CGSize(width: 72, height: 104)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case shortsCollectionView:
            return UIEdgeInsets(top: 0, left: 7, bottom: 0, right: 7)
        case categoryCollectionView:
            return UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        default:
            return .zero
        }
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case shortsCollectionView:
            return 0
        case categoryCollectionView:
            return 9
        default:
            return 0
        }
    }
}
