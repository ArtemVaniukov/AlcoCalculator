//
//  SettingsViewController.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 06.01.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var mainTitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupFonts()
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func callPopUpPressed(_ sender: UIButton) {
        let contentView = UIView()
        contentView.backgroundColor = .green
        contentView.frame = CGRect(x: 0, y: 0, width: 375, height: 600)
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonPressed(sender:)), for: UIControl.Event.touchUpInside)
        contentView.addSubview(button)
        button.frame = CGRect(x: contentView.center.x, y: contentView.center.y, width: 20, height: 20)
        button.backgroundColor = .yellow
        
        
        present(PopUpManager(contentView: contentView).present(), animated: true, completion: nil)
    }
    
    @objc func buttonPressed(sender: UIButton) {
        sender.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: CGFloat.random(in: 0...1))
        print("Button has been pressed!")
    }
    
    @IBAction func languageButtonTapped(_ sender: UIButton) {
        if sender.currentTitle == "Russian" {
            Settings.shared.setLanguage(to: .ru)
        } else if sender.currentTitle == "English" {
            Settings.shared.setLanguage(to: .en)
        }
        self.view.setNeedsDisplay()
        self.view.setNeedsLayout()
    }
    
}


// MARK: - Views Setup
extension SettingsViewController {
    private func setupFonts() {
        let text = K.Text()
        mainTitleLabel.text = text.settings
        mainTitleLabel.textColor = K.Color.mainTitleColor
    }
}
