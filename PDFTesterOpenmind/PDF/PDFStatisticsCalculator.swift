//
//  PDFStatisticsCalculator.swift
//  PDFTesterOpenmind
//
//  Created by Martijn van Gogh on 12-09-18.
//  Copyright © 2018 Martijn van Gogh. All rights reserved.
//

import Foundation

class PDFStatisticsCalculator {

    var diaries: [DiaryEntry]

    init(diaries: [DiaryEntry]) {
        self.diaries = diaries
    }

    func getAverageIntensityFor(type: DiaryType, diaries: [DiaryEntry]) -> String {
        var acculuatedAmount: Float = 0
        let filteredDiaries = diaries.filter {$0.type == type }
        if filteredDiaries.count > 0 {
            for diary in filteredDiaries {
                if let intensity = diary.intensity {
                    acculuatedAmount += intensity
                }
            }
            return "\(acculuatedAmount / Float(filteredDiaries.count))"
        } else {
            return "Geen dagboeken"
        }
    }
}
