//
//  StomachEmptinessAPI.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 04.01.2021.
//

import Foundation

enum StomachEmptiness: Int {
    case empty = 1
    case full
}

class StomachEmptinessAPI {
    
    static var shared = StomachEmptinessAPI()
    
    private init() { }
    
    private var currentEmptinessSelection: StomachEmptiness?
    
    func setCurrentEmptinessSelection(_ selection: StomachEmptiness) {
        self.currentEmptinessSelection = selection
    }
    
    func getCurrentEmptinessSelection() -> StomachEmptiness? {
        return currentEmptinessSelection
    }
    
}
