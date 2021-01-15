//
//  HeightAPI.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 05.01.2021.
//

import Foundation

class HeightAPI {
    
    static var shared = HeightAPI()
    
    private init() { }
    
    private var currentHeightSelection: Int = 187 // Mockup value, should be Int?
    
    func setCurrentHeightSelection(_ height: Int) {
        self.currentHeightSelection = height
    }
    
    func getCurrentHeightSelection() -> Int? {
        return currentHeightSelection
    }
    
}
