//
//  DelegatePracticeVC.swift
//  29th-week7-seminar
//
//  Created by 안현주 on 2021/11/27.
//

import UIKit

class DelegatePracticeVC: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var warningLabel: UILabel!
    var nameList: [String] = []
    var selectedNameList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDataList()
        configCollectionView()
    }
    
    func configCollectionView(){
        let nibName = UINib(nibName: KeywordCVC.identifier, bundle: nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: KeywordCVC.identifier)
        collectionView.dataSource = self
    }
    
    func initDataList(){
        nameList.append(contentsOf: ["김루희","김선영","김소연","김수연","김승찬","김윤서","김인환",
                                     "김지수","김태현","김현규","김혜수","박예빈","박익범","배은서",
                                     "송지훈","신윤아","안현주","양수빈","이경민","이남준","이유진",
                                     "이준호","임주민","장혜령","정은희","정정빈","조양원","최은주",
                                     "최이준","홍승현","황지은"])
    }


}

extension DelegatePracticeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeywordCVC.identifier, for: indexPath) as? KeywordCVC else {return UICollectionViewCell()}
        cell.setKeyword(text: nameList[indexPath.row])
        
        //closure 부분
        if nameList[indexPath.row] == "안현주"{
            cell.presentingClosure = {
                guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: FirstVC.identifier) else {return}
                self.present(nextVC, animated: true, completion: nil)
            }
        }
        
        
        cell.keywordDelegate = self
        return cell
    }
}

//extension DelegatePracticeVC: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 72, height: 104)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return .zero
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
//
//}
//
extension DelegatePracticeVC: KeywordCellDelegate {
    func keywordCellSelected(cell: KeywordCVC) {
        selectedNameList.append(cell.keyword)
        print("selectedNameList = \(selectedNameList)")
        updateWarningLabel()
    }
    
    func keywordCellUnSelected(cell: KeywordCVC, unselectedName: String) {
        let deletingIndex = selectedNameList.firstIndex(of: unselectedName) ?? -1
        selectedNameList.remove(at: deletingIndex)
        print("selectedNameList = \(selectedNameList)")
        updateWarningLabel()
    }
    
    func updateWarningLabel(){
        warningLabel.text = "\(selectedNameList.count)명이 선택되었습니다."
        warningLabel.textColor = selectedNameList.count > 8 ? .red : .black
    }
    
    
}
