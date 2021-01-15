//
//  TitleCell.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 26.12.2020.
//

import UIKit

protocol TitleCellDelegate {
    func goToSettings()
}

class TitleCell: UITableViewCell {

    @IBOutlet weak private var titleLabel: UILabel!
    
    static var delegate: TitleCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        setupFonts()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func settingsButtonPressed(_ sender: UIButton) {
        TitleCell.delegate?.goToSettings()
    }
    
}


// MARK: - Views Setup
extension TitleCell {
    private func setupViews() {
        titleLabel.textColor = K.Color.mainTitleColor
    }
    
    private func setupFonts() {
        let text = K.Text()
        titleLabel.text = text.alcoCalculator
    }
}

extension TitleCell: CustomCellCreatable {
    var nibName: String {
        return "TitleCell"
    }
    
    func createCell() -> Self {
        return self
    }
}
