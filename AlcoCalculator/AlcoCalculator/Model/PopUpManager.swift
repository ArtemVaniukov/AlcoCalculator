//
//  PopUpManager.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 10.01.2021.
//

import UIKit

class PopUpManager {
    
    let contentView: UIView?
    
    init(contentView: UIView) {
        self.contentView = contentView
    }
    
    func present() -> UIViewController {
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "PopUpVC") as! PopUpViewController
        
        popUpVC.providesPresentationContextTransitionStyle = true
        popUpVC.definesPresentationContext = true
        popUpVC.modalTransitionStyle = .crossDissolve
        popUpVC.modalPresentationStyle = .overCurrentContext
        
        popUpVC.contentView = contentView
        
        return popUpVC
    }
    
}
