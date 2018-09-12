//
//  PDFGenerator.swift
//  PDFTesterOpenmind
//
//  Created by Martijn van Gogh on 27-08-18.
//  Copyright © 2018 Martijn van Gogh. All rights reserved.
//

import Foundation
import UIKit
import SimplePDF

class PDFGenerator {

    var diaries: [DiaryEntry]

    init(diaries: [DiaryEntry]) {
        self.diaries = diaries
    }

    // MARK: Generates and saves pdf locally
    public func generatePDF(diaryEntries: [DiaryEntry]) {

        let A4paperSize = CGSize(width: 595, height: 842)
        let pdf = SimplePDF(pageSize: A4paperSize)

        setUpPDFTop(pdf: pdf)
        setUpPDFPDFStatistics()
        for entry in diaryEntries {
            setUpPDFBody(entry: entry, pdf: pdf)
        }

        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fileUrl = URL(fileURLWithPath: documentsPath)
        let endUrl = fileUrl.appendingPathComponent("diaryPDF")

        let pdfData = pdf.generatePDFdata()

        do {
            try pdfData.write(to: endUrl, options: .atomicWrite)
        } catch {
            print(error)
        }
    }

    private func setUpPDFTop(pdf: SimplePDF) {
        //TODO: add image
        pdf.addVerticalSpace(30)
        pdf.addLineSeparator(height: 2)
    }

    private func setUpPDFPDFStatistics() {

    }

    private func setUpPDFBody(entry: DiaryEntry, pdf: SimplePDF) {

        switch entry.type {
        case .anxiety:
            pdf.addText("Intensiteit")

        case .depression:
        case .ruminating:
        case .sleep:
        case .stress:

        default:
            <#code#>
        }
    }

}

