//
//  WeightAPI.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 05.01.2021.
//

import Foundation

class WeightAPI {
    
    static var shared = WeightAPI()
    
    private init() { }
    
    private var currentWeightSelection: Int = 96 // Mockup value, should be Int?
    
    func setCurrentWeightSelection(_ weight: Int) {
        self.currentWeightSelection = weight
    }
    
    func getCurrentWeightSelection() -> Int? {
        return currentWeightSelection
    }
    
}
