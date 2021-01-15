//
//  StomachEmptinessCell.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 26.12.2020.
//

import UIKit

class StomachEmptinessCell: UITableViewCell {

    @IBOutlet weak private var mainLabel: UILabel!
    @IBOutlet weak private var emptyButton: UIButton!
    @IBOutlet weak private var fullButton: UIButton!
    
    @IBOutlet var buttons: [UIButton]!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        setupFonts()
        setupCurrentSelection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: false)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        setupViews()
        setActive(for: sender.tag)
    }
    
}


// MARK: - Views Setup

extension StomachEmptinessCell {
    private func setupViews() {
        buttons.forEach() {
            $0.backgroundColor = K.Color.addButtonBackground
            $0.setTitleColor(K.Color.addButtonTitle, for: .normal)
            $0.layer.cornerRadius = 16
        }
    }
    
    private func setActive(for tag: Int) {
        buttons.forEach() {
            if $0.tag == tag {
                $0.backgroundColor = K.Color.accentColor
                $0.setTitleColor(K.Color.mainTitleColor, for: .normal)
                
                StomachEmptinessAPI.shared.setCurrentEmptinessSelection(StomachEmptiness(rawValue: tag)!)
            }
        }
    }
    
    private func setupCurrentSelection() {
        if let tag = StomachEmptinessAPI.shared.getCurrentEmptinessSelection()?.rawValue {
            setActive(for: tag)
        }
    }
    
    private func setupFonts() {
        let text = K.Text()
        mainLabel.textColor = K.Color.titleColor
        mainLabel.text = text.stomachFullness
        emptyButton.setTitle(text.empty, for: .normal)
        fullButton.setTitle(text.full, for: .normal)
    }
    
}

extension StomachEmptinessCell: CustomCellCreatable {
    var nibName: String {
        return "StomachEmptinessCell"
    }
    
    func createCell() -> Self {
        return self
    }
    
}
