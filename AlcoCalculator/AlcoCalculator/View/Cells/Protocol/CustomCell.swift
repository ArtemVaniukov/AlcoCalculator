//
//  CustomCell.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 29.12.2020.
//

import UIKit

protocol CustomCellCreatable {
    var nibName: String { get }
    func createCell() -> Self
}

extension CustomCellCreatable {
    func createCell<T: UITableViewCell>() -> T? {
        let nib = UINib(nibName: nibName, bundle: nil)
        let cell = nib.instantiate(withOwner: self, options: nil).last as? T
        return cell
    }
}
