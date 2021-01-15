//
//  PopUpViewController.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 08.01.2021.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var contentViewContainer: UIView!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        contentViewContainer.addSubview(contentView)
        contentView.frame = contentViewContainer.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        topConstraint.constant = 10
        
        popUpAnimation()
    }
    
}

// MARK: Views Setup
extension PopUpViewController {
    func setupView() {
        view.backgroundColor = .clear
        
        var blurEffect: UIBlurEffect {
            if #available(iOS 13.0, *) {
                return .init(style: .systemUltraThinMaterialDark)
            } else {
                return .init(style: .prominent)
            }
        }
        
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    func popUpAnimation() {
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
    }
    
}
