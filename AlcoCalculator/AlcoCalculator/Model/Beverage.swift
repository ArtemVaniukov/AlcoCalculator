//
//  Beverage.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 24.12.2020.
//

import Foundation

class Beverage {
    var degrees: Int
    var volume: Int
    
    init(degrees: Int = 40, volume: Int = 1000) {
        self.degrees = degrees
        self.volume = volume
    }
    
}
