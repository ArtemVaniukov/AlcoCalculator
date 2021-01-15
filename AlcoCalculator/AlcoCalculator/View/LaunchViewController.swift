//
//  LaunchViewController.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 08.01.2021.
//

import UIKit

class LaunchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self = self else { return }
            self.performSegue(withIdentifier: "LaunchToMain", sender: self)
        }
    }

}
