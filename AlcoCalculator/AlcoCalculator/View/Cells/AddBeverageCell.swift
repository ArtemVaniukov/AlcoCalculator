//
//  AddCell.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 27.12.2020.
//

import UIKit

protocol AddBeverageCellDelegate {
    func addNewBeverageCell()
}

class AddBeverageCell: UITableViewCell {

    @IBOutlet weak private var addButton: UIButton!
    
    static var delegate: AddBeverageCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        setupFonts()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        AddBeverageCell.delegate?.addNewBeverageCell()
    }
    
}

// MARK: - Views Setup
extension AddBeverageCell {
    private func setupViews() {
        addButton.backgroundColor = K.Color.addBeverageButtonBackground
        addButton.layer.cornerRadius = 16
//        addButton.layer.borderWidth = 1
//        addButton.layer.borderColor = K.Color.addButtonBorder?.cgColor
    }
    
    private func setupFonts() {
        let text = K.Text()
        addButton.setTitleColor(K.Color.addButtonTitle, for: .normal)
        addButton.setTitle(text.addDrink, for: .normal)
    }
    
}

extension AddBeverageCell: CustomCellCreatable {
    var nibName: String {
        return "AddBeverageCell"
    }
    
    func createCell() -> Self {
        return self
    }
    
}
