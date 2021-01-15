//
//  K.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 30.12.2020.
//

import UIKit

struct K {
    struct Color {
        static let accentColor = UIColor(named: "AccentColor") // #5956E9 !
        static let addButtonBackground = UIColor(named: "AddButtonBackground") // #161626 !
        static let addBeverageButtonBackground = UIColor(named: "AddBeverageButtonBackground") // #1D1D2C
        static let addButtonBorder = UIColor(named: "AddButtonBorder")?.withAlphaComponent(0.04) // #000000 4%
        static let addButtonTitle = UIColor(named: "AddButtonTitle") // #9999FAE
        static let backgroundColor = UIColor(named: "BackgroundColor") // 040415 !
        static let borderColor = UIColor(named: "BorderColor") // #ECF2F6
        static let mainTitleColor = UIColor(named: "MainTitleColor") // #FFFFFF !
        static let titleColor = UIColor(named: "TitleColor") // #CDCDD0 !
        static let darkTitleColor = UIColor(named: "DarkTitleColor") // #9099A3 !
    }
    
    struct Text {
        static private let pack = LanguagePack.shared
        
        let alcoCalculator = pack.getTranslatedString(for: "AlcoCalculator")
        let gender = pack.getTranslatedString(for: "Gender")
        let male = pack.getTranslatedString(for: "Male")
        let female = pack.getTranslatedString(for: "Female")
        let weight = pack.getTranslatedString(for: "Weight")
        let lb = pack.getTranslatedString(for: "Lb")
        let kg = pack.getTranslatedString(for: "Kg")
        let height = pack.getTranslatedString(for: "Height")
        let ft = pack.getTranslatedString(for: "Ft")
        let cm = pack.getTranslatedString(for: "Cm")
        let stomachFullness = pack.getTranslatedString(for: "StomachFullness")
        let full = pack.getTranslatedString(for: "Full")
        let empty = pack.getTranslatedString(for: "Empty")
        let alcoholConsumed = pack.getTranslatedString(for: "AlcoholConsumed")
        let drink = pack.getTranslatedString(for: "Drink")
        let proof = pack.getTranslatedString(for: "Proof")
        let degrees = pack.getTranslatedString(for: "Degrees")
        let sizeOz = pack.getTranslatedString(for: "SizeOz")
        let sizeMl = pack.getTranslatedString(for: "SizeMl")
        let addDrink = pack.getTranslatedString(for: "AddDrink")
        let afterDrinking = pack.getTranslatedString(for: "AfterDrinking")
        let hours = pack.getTranslatedString(for: "Hours")
        let result = pack.getTranslatedString(for: "Result")
        let behindTheWheel = pack.getTranslatedString(for: "BehindTheWheel")
        let alcoholConcentration = pack.getTranslatedString(for: "AlcoholConcentration")
        let intoxication = pack.getTranslatedString(for: "Intoxication")
        let settings = pack.getTranslatedString(for: "Settings")
        let language = pack.getTranslatedString(for: "Language")
        let country = pack.getTranslatedString(for: "Country")
        let units = pack.getTranslatedString(for: "Units")
        let KGs = pack.getTranslatedString(for: "KGs")
        let LBs = pack.getTranslatedString(for: "LBs")
        let CMs = pack.getTranslatedString(for: "CMs")
        let INs = pack.getTranslatedString(for: "INs")
        let alcoholStrength = pack.getTranslatedString(for: "AlcoholStrength")
        let Degree = pack.getTranslatedString(for: "Degree")
        let proofs = pack.getTranslatedString(for: "Proofs")
        let volume = pack.getTranslatedString(for: "Volume")
        let MLs = pack.getTranslatedString(for: "MLs")
        let OZ = pack.getTranslatedString(for: "OZ")
    }
}
