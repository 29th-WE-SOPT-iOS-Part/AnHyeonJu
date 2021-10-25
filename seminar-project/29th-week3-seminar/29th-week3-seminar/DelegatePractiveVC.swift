//
//  DelegatePractiveVC.swift
//  29th-week3-seminar
//
//  Created by 안현주 on 2021/10/23.
//

import UIKit

class DelegatePractiveVC: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var partImageView: UIImageView!
    @IBOutlet weak var partPickerView: UIPickerView!
    
    var partList : [PartData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        initPartData()
        textfield.delegate = self
        partPickerView.dataSource = self
        partPickerView.delegate = self
    }
    
    func initPartData() {
        partList.append(contentsOf : [
            PartData(imageName: "wesoptiOSPart", partName: "iOS"),
            PartData(imageName: "wesoptAndroidPart", partName: "Android"),
            PartData(imageName: "wesoptWebPart", partName: "Web"),
            PartData(imageName: "wesoptServerPart", partName: "Server"),
            PartData(imageName: "wesoptDesignPart", partName: "Design"),
            PartData(imageName: "wesoptPlanPart", partName: "Plan"),
        ])
    }
    
    
}

extension DelegatePractiveVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("textFieldShoudReturn")
        textfield.endEditing(true) //텍스 필드의 편집을 끝내는 메소드
        return true
    }
}


extension DelegatePractiveVC: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return partList.count
    }
}

extension DelegatePractiveVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //partList에서 row번째 있는 PartData의 partName으로 title 설정
        return partList[row].partName
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //partList에서 row번째 있는 PartData의 UIImage를 가져오는 함수 호출하여
        //partImageView의 image로 설정
        partImageView.image = partList[row].makeImage()
        
        //partList에서 row번째 있는 PartData의 partName을 가져와
        //textfield의 text로 지정
        textfield.text = partList[row].partName
    }
}
