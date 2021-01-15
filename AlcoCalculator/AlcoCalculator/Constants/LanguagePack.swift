//
//  LanguagePack.swift
//  AlcoCalculator
//
//  Created by Artem Vaniukov on 08.01.2021.
//

import Foundation

class LanguagePack {
    
    static var shared = LanguagePack()
    var language = Settings.shared.getLanguage()
    
    private init() {
        Settings.shared.delegate = self
    }
    
    func getTranslatedString(for key: String) -> String {
        if language == .ru {
            return ru[key] ?? "Wrong key \(key) at LanguagePack"
        } else if language == .en {
            return en[key] ?? "Wrong key \(key) at LanguagePack"
        } else {
            assertionFailure("Failed to get translated string at LanguagePack - getTranslatedString()")
            return ""
        }
    }
    
    private let ru = ["AlcoCalculator" : "Калькулятор \nтрезвости",
              "Gender" : "Пол",
              "Male" : "Мужской",
              "Female" : "Женский",
              "Weight" : "Вес",
              "Lb" : "фнт",
              "Kg" : "кг",
              "Height" : "Рост",
              "Ft" : "фт",
              "Cm" : "см",
              "StomachFullness" : "Наполненность желудка",
              "Full" : "Полный",
              "Empty" : "Пустой",
              "AlcoholConsumed" : "Выпито алкоголя",
              "Drink" : "Напиток",
              "Proof" : "Пруф / %",
              "Degrees" : "Градус / %",
              "SizeOz" : "Объём / ун",
              "SizeMl" : "Объём / мл",
              "AddDrink" : "Добавить напиток",
              "AfterDrinking" : "После употребления прошло",
              "Hours" : "Часов",
              "Result" : "Расчитать",
              "BehindTheWheel" : "Сесть за руль  можно через",
              "AlcoholConcentration" : "Концентрация алкоголя",
              "Intoxication" : "Степень опьянения",
              "Settings" : "Настройки",
              "Language" : "Язык",
              "Country" : "Страна",
              "Units" : "Системы измерения",
              "KGs" : "Килограммы",
              "LBs" : "Фунты",
              "CMs" : "Сантиметры",
              "INs" : "Дюймы",
              "AlcoholStrength" : "Крепость",
              "Degree" : "Градусы",
              "Proofs" : "Пруфы",
              "Volume" : "Объем",
              "MLs" : "Миллилитры",
              "OZ" : "Унции"
    ]
    
    private let en = ["AlcoCalculator" : "Alco \ncalculator",
              "Gender" : "Gender",
              "Male" : "Male",
              "Female" : "Female",
              "Weight" : "Weight",
              "Lb" : "lb",
              "Kg" : "kg",
              "Height" : "Height",
              "Ft" : "ft",
              "Cm" : "cm",
              "StomachFullness" : "Stomach fullness",
              "Full" : "Complete",
              "Empty" : "Empty",
              "AlcoholConsumed" : "Alcohol consumed",
              "Drink" : "Drink",
              "Proof" : "Proof / %",
              "Degrees" : "Degrees / %",
              "SizeOz" : "Size / oz",
              "SizeMl" : "Size / ml",
              "AddDrink" : "Add drink",
              "AfterDrinking" : "After drinking",
              "Hours" : "Hours",
              "Result" : "Result",
              "BehindTheWheel" : "You can get behind the wheel via",
              "AlcoholConcentration" : "The concentration of alcohol",
              "Intoxication" : "Degree of intoxication",
              "Settings" : "Settings",
              "Language" : "Language",
              "Country" : "Country",
              "Units" : "Measurement Units",
              "KGs" : "Kilograms",
              "LBs" : "Pounds",
              "CMs" : "Centimeters",
              "INs" : "Inches",
              "AlcoholStrength" : "Alcohol strength in",
              "Degree" : "Degrees",
              "Proofs" : "Proofs",
              "Volume" : "Volume",
              "MLs" : "Milliliters",
              "OZ" : "Ounces"
    ]
}

extension LanguagePack: SettingsDelegate {
    func languageHasBeenChanged() {
        self.language = Settings.shared.getLanguage()
    }
}
