//
//  CategoryCollectionViewCell.swift
//  Youtube-Clone
//
//  Created by 안현주 on 2021/10/29.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties
    static let identifier = "CategoryCollectionViewCell"
    
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    
    // MARK: - Custom Method
    private func setUI() {
        borderView.layer.cornerRadius = 15
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = #colorLiteral(red: 0.8549019608, green: 0.8549019608, blue: 0.8549019608, alpha: 1)
        borderView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
    }
    
    func setData(categoryText: String) {
        categoryLabel.text = categoryText
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                //select
                borderView.backgroundColor = #colorLiteral(red: 0.376, green: 0.376, blue: 0.376, alpha: 1)
                categoryLabel.textColor = .white
            } else {
                //unselect
                borderView.backgroundColor = #colorLiteral(red: 0.9490196078, green: 0.9490196078, blue: 0.9490196078, alpha: 1)
                categoryLabel.textColor = .black
            }
        }
    }
    
}
