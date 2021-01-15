//
//  CalculatorManager.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 24.12.2020.
//

import Foundation

protocol CalculatorManagerDelegate {
    func calculationComplete()
}

class CalculatorManager {
    
    static var shared = CalculatorManager()
    
    var delegate: CalculatorManagerDelegate?
    
    private init() { }
    
    func calculatePromille() -> Float? {
        guard let alcohol = getAlcohol(), let weight = getWeight(), let widmarkCoef = getWidmarkCoefficient() else { return nil }
        /// From Wikipedia:
        /// Для получения реальной концентрации этанола в крови из рассчитанной по формуле (1) нужно вычесть от массы выпитого алкоголя А от 10 % до 30 % т. н. дефицита резорбции, так как часть алкоголя не доходит до периферической крови.
        return (alcohol - (alcohol * 0.2)) / (weight * widmarkCoef)
    }
    
    private func getAlcohol() -> Float? {
        let beverages = BeverageAPI.shared.getBeverages()
        var totalAlcohol: Float = 0
        
        beverages.forEach {
            totalAlcohol += calculateAclohol(degrees: $0.degrees, volume: $0.volume)
        }
        
        return totalAlcohol
    }
    
    private func calculateAclohol(degrees: Int, volume: Int) -> Float {
        return Float(volume / 100 * degrees)
    }
    
    private func getWidmarkCoefficient() -> Float? {
        guard let gender = GenderAPI.shared.getCurrentGenderSelection() else { return nil }
        return gender == .male ? 0.7 : 0.6
    }
    
    private func getWeight() -> Float? {
        guard let weight = WeightAPI.shared.getCurrentWeightSelection() else { return nil }
        return Float(weight)
    }
    
    private func getHeight() -> Float? {
        guard let height = HeightAPI.shared.getCurrentHeightSelection() else { return nil }
        return Float(height)
    }
    
}
