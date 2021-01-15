//
//  MainTableViewController.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 25.12.2020.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        tableView.register(UINib(nibName: "BeverageCell", bundle: nil), forCellReuseIdentifier: "BeverageCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        
        AddBeverageCell.delegate = self
        TitleCell.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        case 1:
            return BeverageAPI.shared.getBeverages().count
        case 2:
            return 3
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            return TitleCell().createCell()!
        case (0, 1):
            return GenderCell().createCell()!
        case (0, 2):
            return WeightCell().createCell()!
        case (0, 3):
            return HeightCell().createCell()!
        case (0, 4):
            return StomachEmptinessCell().createCell()!
        case (1, _):
            let text = K.Text()
            let cell = tableView.dequeueReusableCell(withIdentifier: "BeverageCell") as! BeverageCell
            let beverage = BeverageAPI.shared.getBeverages()[indexPath.row]
            
            cell.mainCellLabel.text = text.drink + " \(indexPath.row + 1)"
            cell.degreesTextField.text = "\(beverage.degrees)"
            cell.volumeTextField.text = "\(beverage.volume)"
            cell.index = indexPath.row
            cell.delegate = self
            
            return cell
        case (2, 0):
            return AddBeverageCell().createCell()!
        case (2, 1):
            return TimePassedCell().createCell()!
        case (2, 2):
            return ResultCell().createCell()!
        default:
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            return 172
        case (0, 1):
            return 232
        case (0, 2):
            return 162
        case (0, 3):
            return 180
        case (0, 4):
            return 162
        case (1, _):
            return 240
        case (2, 0):
            return 116
        case (2, 1):
            return 289
        case (2, 2):
            return 204
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section != 1 { return }
        if editingStyle == .delete {
            BeverageAPI.shared.removeBeverage(number: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 1 && indexPath.row > 0 {
            return .delete
        }
        return .none
    }

}

extension MainTableViewController {
    @IBAction func unwindToMain(_ segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
}

extension MainTableViewController: AddBeverageCellDelegate {
    func addNewBeverageCell() {
        BeverageAPI.shared.addBeverage()
        tableView.reloadData()
    }
}

extension MainTableViewController: BeverageCellDelegate {
    func valueHasBeenChanged() {
        tableView.reloadData()
    }
}

extension MainTableViewController: TitleCellDelegate {
    func goToSettings() {
        performSegue(withIdentifier: "MainToSettings", sender: self)
    }
}


