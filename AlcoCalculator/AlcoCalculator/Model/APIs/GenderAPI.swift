//
//  GenderAPI.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 04.01.2021.
//

import Foundation

enum Gender: Int {
    case male = 1
    case female
}

class GenderAPI {
    
    static var shared = GenderAPI()
    
    private init() { }
    
    private var currentGenderSelection: Gender?
    
    func setCurrentGenderSelection(_ gender: Gender) {
        self.currentGenderSelection = gender
    }
    
    func getCurrentGenderSelection() -> Gender? {
        return currentGenderSelection
    }
    
}
