//
//  BeverageTableViewCell.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 24.12.2020.
//

import UIKit

protocol BeverageCellDelegate {
    func valueHasBeenChanged()
}

class BeverageCell: UITableViewCell {
    
    var delegate: BeverageCellDelegate?

    @IBOutlet weak var mainCellLabel: UILabel!
    
    @IBOutlet weak private var degreesView: UIView!
    @IBOutlet weak var degreesUnitLabel: UILabel!
    @IBOutlet weak var degreesTextField: UITextField!
    @IBOutlet weak private var degreesMinus: UIButton!
    @IBOutlet weak private var degreesPlus: UIButton!
    
    @IBOutlet weak private var volumeView: UIView!
    @IBOutlet weak var volumeUnitLabel: UILabel!
    @IBOutlet weak var volumeTextField: UITextField!
    @IBOutlet weak private var volumeMinus: UIButton!
    @IBOutlet weak private var volumePlus: UIButton!
    
    var index: Int!
    
    @IBOutlet private var views: [UIView]!
    @IBOutlet private var buttons: [UIButton]!
    @IBOutlet private var textFields: [UITextField]!
    
    override func awakeFromNib() {
        super.awakeFromNib()        
        setupViews()
        setupFonts()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func changeValueButtonPressed(_ sender: UIButton) {
        let currentDegrees = BeverageAPI.shared.getBeverages()[index].degrees
        let currentVolume = BeverageAPI.shared.getBeverages()[index].volume
        
        switch sender {
        case _ where sender == degreesMinus:
            BeverageAPI.shared.changeDegrees(at: index, to: currentDegrees - 1)
        case _ where sender == degreesPlus:
            BeverageAPI.shared.changeDegrees(at: index, to: currentDegrees + 1)
        case _ where sender == volumeMinus:
            BeverageAPI.shared.changeVolume(at: index, to: currentVolume - 1)
        case _ where sender == volumePlus:
            BeverageAPI.shared.changeVolume(at: index, to: currentVolume + 1)
        default:
            print("Error with recognizing button pressed in - BeverageCell index: \(index ?? -1)")
        }
        
        delegate?.valueHasBeenChanged()
    }
    
    @IBAction func textFieldValueChanged(_ sender: UITextField) {
        guard let value = Int(sender.text!) else { return }
        
        switch sender {
        case _ where sender == degreesTextField:
            BeverageAPI.shared.changeDegrees(at: index, to: value)
        case _ where sender == volumeTextField:
            BeverageAPI.shared.changeVolume(at: index, to: value)
        default:
            print("Error with TextField in - BeverageCell index: \(index ?? -1)")
        }
        
        delegate?.valueHasBeenChanged()
    }
}


extension BeverageCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
    }
}

// MARK: - Views Setup
extension BeverageCell {
    private func setupViews() {
        views.forEach { setupView($0) }
        buttons.forEach { setupButton($0) }
    }
    
    private func setupView(_ view: UIView) {
        view.layer.borderWidth = 2
        view.layer.borderColor = K.Color.addButtonBackground?.cgColor
        view.layer.cornerRadius = 16
    }
    
    private func setupButton(_ button: UIButton) {
        button.layer.backgroundColor = K.Color.addButtonBackground?.cgColor
        button.layer.cornerRadius = 10
        button.setTitleColor(K.Color.mainTitleColor, for: .normal)
    }
    
    private func setupTextFields(_ textField: UITextField) {
        textField.tintColor = K.Color.accentColor
    }
    
    private func setupFonts() {
        let text = K.Text()
        mainCellLabel.textColor = K.Color.darkTitleColor
        
        let degreesUnit = Settings.shared.getAlcoholMeasurementUnit()
        degreesUnitLabel.text = (degreesUnit == .vol) ? text.degrees : text.proof
        degreesUnitLabel.textColor = K.Color.mainTitleColor?.withAlphaComponent(0.4)
        
        let volumeUnit = Settings.shared.getVolumeUnit()
        volumeUnitLabel.text = (volumeUnit == .ml) ? text.sizeMl : text.sizeOz
        volumeUnitLabel.textColor = K.Color.mainTitleColor?.withAlphaComponent(0.4)
        
        degreesTextField.textColor = K.Color.accentColor
        volumeTextField.textColor = K.Color.accentColor
    }
}

extension BeverageCell: CustomCellCreatable {
    var nibName: String {
        return "BeverageCell"
    }
    
    func createCell() -> Self {
        return self
    }
}
