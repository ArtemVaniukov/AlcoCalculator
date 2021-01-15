//
//  HeightCell.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 26.12.2020.
//

import UIKit

class HeightCell: UITableViewCell {

    @IBOutlet weak private var heightLabel: UILabel!
    @IBOutlet weak private var heightUnitLabel: UILabel!
    
    @IBOutlet weak private var pickerView: UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupFonts()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
}

// MARK: - Views Setup
extension HeightCell {
    private func setupFonts() {
        let text = K.Text()
        heightLabel.text = text.height
        heightLabel.textColor = K.Color.titleColor
        
        let heightUnit = Settings.shared.getHeightUnit()
        
        heightUnitLabel.text = (heightUnit == .cm) ? text.cm : text.lb
        heightUnitLabel.textColor = K.Color.addButtonTitle
    }
}

extension HeightCell: CustomCellCreatable {
    var nibName: String {
        return "HeightCell"
    }
    
    func createCell() -> Self {
        return self
    }
}
