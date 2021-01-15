//
//  GenderCell.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 26.12.2020.
//

import UIKit

class GenderCell: UITableViewCell {
    
    @IBOutlet weak var mainTitle: UILabel!
    
    @IBOutlet weak private var maleView: UIView!
    @IBOutlet weak private var maleImageView: UIImageView!
    @IBOutlet weak private var maleLabel: UILabel!
    @IBOutlet weak private var maleButton: UIButton!
    
    @IBOutlet weak private var femaleView: UIView!
    @IBOutlet weak private var femaleImageView: UIImageView!
    @IBOutlet weak private var femaleLabel: UILabel!
    @IBOutlet weak private var femaleButton: UIButton!
    
    @IBOutlet var views: [UIView]!
    @IBOutlet var labels: [UILabel]!
    
    /// Male view has tag = 1
    /// Female view has tag = 2
    
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
        let tag = sender.tag
        setupViews()
        setActive(for: tag)
    }
    
}

// MARK: - Views Setup
extension GenderCell {
    private func setActive(for tag: Int) {
        views.forEach() {
            if $0.tag == tag {
                //$0.layer.borderWidth = 3
                $0.layer.borderColor = K.Color.accentColor?.cgColor
                $0.layer.backgroundColor = K.Color.accentColor?.cgColor
                
                GenderAPI.shared.setCurrentGenderSelection(Gender(rawValue: tag)!)
            }
        }
        
        labels.forEach() {
            if $0.tag == tag {
                $0.textColor = K.Color.mainTitleColor
            }
        }
    }
    
    private func setupCurrentSelection() {
        if let tag = GenderAPI.shared.getCurrentGenderSelection()?.rawValue {
            setActive(for: tag)
        }
    }
    
    private func setupViews() {
        views.forEach {
            $0.layer.borderWidth = 0
            $0.layer.backgroundColor = K.Color.addButtonBackground?.cgColor
            $0.layer.cornerRadius = 16
        }
        
        labels.forEach() {
            $0.textColor = K.Color.addButtonTitle
        }
    }
    
    private func setupFonts() {
        let text = K.Text()
        mainTitle.text = text.gender
        mainTitle.textColor = K.Color.titleColor
        maleLabel.text = text.male
        femaleLabel.text = text.female
    }
    
}

extension GenderCell: CustomCellCreatable {
    var nibName: String {
        return "GenderCell"
    }
    
    func createCell() -> Self {
        return self
    }
}
