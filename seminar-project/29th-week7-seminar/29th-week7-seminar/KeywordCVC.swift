//
//  KeywordCVC.swift
//  29th-week7-seminar
//
//  Created by 안현주 on 2021/11/27.
//

import UIKit

protocol KeywordCellDelegate{
    func keywordCellSelected(cell: KeywordCVC)
    func keywordCellUnSelected(cell: KeywordCVC, unselectedName: String)
}


class KeywordCVC: UICollectionViewCell {

    static let identifier = "KeywordCVC"
    @IBOutlet weak var keywordButton: UIButton!
    var keyword: String = ""
    var selectedKeyword:Bool = false
    var keywordDelegate: KeywordCellDelegate?
    
    //클로저 써보기
    var presentingClosure: (() -> ())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func touchUpToSelect(_ sender: Any) {
        if selectedKeyword{
            keywordDelegate?.keywordCellUnSelected(cell: self, unselectedName: keyword)
            keywordButton.backgroundColor = .clear
        } else{
            keywordDelegate?.keywordCellSelected(cell: self)
            keywordButton.backgroundColor = .yellow
            presentingClosure?()
        }
        
        selectedKeyword.toggle()
        
    }
    
    func setKeyword(text: String){
        keyword = text
        keywordButton.setTitle(keyword, for: .normal)
    }

}
