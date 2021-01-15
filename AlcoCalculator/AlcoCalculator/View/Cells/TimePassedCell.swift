//
//  TimePassedCell.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 27.12.2020.
//

import UIKit

class TimePassedCell: UITableViewCell {

    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var hoursTitle: UILabel!
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet var buttons: [UIButton]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        setupFonts()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
    }
    
}

// MARK: - Views Setup
extension TimePassedCell {
    private func setupViews() {
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 2
        view.layer.borderColor = K.Color.addButtonBackground?.cgColor
        
        buttons.forEach() {
            $0.layer.backgroundColor = K.Color.addButtonBackground?.cgColor
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setupFonts() {
        let text = K.Text()
        mainTitle.text = text.afterDrinking
        mainTitle.textColor = K.Color.titleColor
        
        hoursTitle.text = text.hours
        hoursTitle.textColor = K.Color.mainTitleColor?.withAlphaComponent(0.4)
    }
    
}

extension TimePassedCell: CustomCellCreatable {
    var nibName: String {
        return "TimePassedCell"
    }
    
    func createCell() -> Self {
        return self
    }
}
