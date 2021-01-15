//
//  Settings.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 07.01.2021.
//

import Foundation

protocol SettingsDelegate {
    func languageHasBeenChanged()
}

class Settings {
    
    static var shared = Settings()
    var delegate: SettingsDelegate?
    
    private init() { }
    
    private var weight: WeightUnit = .kg
    private var height: HeightUnit = .cm
    private var alcoholMeasurement: AlcoholUnit = .vol
    private var volume: VolumeUnit = .ml
    
    private var language: Language = .en {
        didSet {
            delegate?.languageHasBeenChanged()
        }
    }
    
    func getWeightUnit() -> WeightUnit {
        return weight
    }
    
    func getHeightUnit() -> HeightUnit {
        return height
    }
    
    func getAlcoholMeasurementUnit() -> AlcoholUnit {
        return alcoholMeasurement
    }
    
    func getVolumeUnit() -> VolumeUnit {
        return volume
    }
    
    func getLanguage() -> Language {
        return language
    }
    
    func setLanguage(to language: Language) {
        self.language = language
        print("Do language API")
    }
    
}
