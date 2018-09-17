//
//  PDFStatisticsCalculator.swift
//  PDFTesterOpenmind
//
//  Created by Martijn van Gogh on 12-09-18.
//  Copyright © 2018 Martijn van Gogh. All rights reserved.
//

import Foundation

// MARK: Gets 1. average intensities for last month of diaries (per type) 2. Selected diaries per type.
class PDFLayoutAssembler {

    var allDiaries: [DiaryEntry]

    init(diaries: [DiaryEntry]) {
        self.allDiaries = diaries
    }

    func getAverageIntensityFor(type: DiaryType, diaries: [DiaryEntry]) -> String {
        var acculuatedAmount: Float = 0
        let filteredDiaries = diaries.filter {$0.type == type } //TODO: Add datefilter last month
        if filteredDiaries.count > 0 {
            for diary in filteredDiaries {
                if let intensity = diary.intensity {
                    acculuatedAmount += intensity
                }
            }
            if type == .sleep {
                return "\(acculuatedAmount / Float(filteredDiaries.count)) uur slaap"
            } else {
                return "\(acculuatedAmount / Float(filteredDiaries.count))"
            }
        } else {
            return "Geen dagboeken"
        }
    }
    func getSelectedDiariesFor(type: DiaryType) -> [DiaryEntry] {
        return allDiaries.filter { $0.type == type }
    }

}
