//
//  WeightCell.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 26.12.2020.
//

import UIKit

class WeightCell: UITableViewCell {
    
    @IBOutlet weak var weightTitle: UILabel!
    @IBOutlet weak var weightUnitTitle: UILabel!
    
    @IBOutlet weak var picker: UIPickerView!
    
    var pickerData = Array(1...200)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFonts()
        
        picker.delegate = self
        picker.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
}

// MARK: - PickerView
extension WeightCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(pickerData[row])
    }
    
}


// MARK: - Views Setup
extension WeightCell {
    private func setupFonts() {
        let text = K.Text()
        weightTitle.text = text.weight
        weightTitle.textColor = K.Color.mainTitleColor?.withAlphaComponent(0.8)
        
        let weightUnit = Settings.shared.getWeightUnit()
        
        weightUnitTitle.text = (weightUnit == .kg) ? text.kg : text.lb
        weightUnitTitle.textColor = K.Color.addButtonTitle
    }
}

extension WeightCell: CustomCellCreatable {
    var nibName: String {
        return "WeightCell"
    }
    
    func createCell() -> Self {
        return self
    }
}
