//
//  BeverageAPI.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 25.12.2020.
//

import Foundation

class BeverageAPI {
    
    static var shared = BeverageAPI()
    
    private init() { }
    
    private var beverages = [Beverage()]
    
    func getBeverages() -> [Beverage] {
        return beverages
    }
    
    func addBeverage() {
        beverages.append(Beverage())
    }
    
    func removeBeverage(number index: Int) {
        guard index > 0 else { return }
        beverages.remove(at: index)
    }
    
    func changeDegrees(at index: Int, to value: Int) {
        beverages[index].degrees = value
    }
    
    func changeVolume(at index: Int, to value: Int) {
        beverages[index].volume = value
    }
    
}
