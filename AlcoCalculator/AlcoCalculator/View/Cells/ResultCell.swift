//
//  ResultCell.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 27.12.2020.
//

import UIKit

class ResultCell: UITableViewCell {

    @IBOutlet weak var getResultsTitle: UILabel!
    @IBOutlet weak var resultButtonView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        setupFonts()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func getResultButtonPressed(_ sender: UIButton) {
        print(CalculatorManager.shared.calculatePromille())
    }
    
}


// MARK: - Views Setup
extension ResultCell {
    private func setupView() {
        resultButtonView.layer.cornerRadius = 20
        resultButtonView.backgroundColor = K.Color.accentColor
    }
    
    private func setupFonts() {
        let text = K.Text()
        getResultsTitle.text = text.result
        getResultsTitle.textColor = K.Color.mainTitleColor
    }
}

extension ResultCell: CustomCellCreatable {
    var nibName: String {
        return "ResultCell"
    }
    
    func createCell() -> Self {
        return self
    }
}
