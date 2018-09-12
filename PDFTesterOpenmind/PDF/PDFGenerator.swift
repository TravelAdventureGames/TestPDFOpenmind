//
//  PDFGenerator.swift
//  PDFTesterOpenmind
//
//  Created by Martijn van Gogh on 27-08-18.
//  Copyright © 2018 Martijn van Gogh. All rights reserved.
//

import Foundation
import UIKit
import TPPDF

class PDFAssembler {

    var diaries: [DiaryEntry]

    init(diaries: [DiaryEntry]) {
        self.diaries = diaries
    }

    // MARK: Generates and saves pdf locally
    public func generatePDF(diaryEntries: [DiaryEntry]) {


        let pdf = PDFDocument(format: .a4)

        pdf.addText(text: "Error handling in Swift has come a long way since the patterns in Swift 1 that were inspired by Objective-C. Major improvements in Swift 2 made the experience of handling unexpected states and conditions in your application more straightforward. These benefits continue in Swift 3, but there are no significant updates to error handling made in the latest version of the language. (Phew!)")

        //setUpPDFTop(pdf: pdf)
        //setUpPDStatistics()
        
        for entry in diaryEntries {
            //setUpPDFBody(entry: entry, pdf: pdf)
        }
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fileUrl = URL(fileURLWithPath: documentsPath)
        let endUrl = fileUrl.appendingPathComponent("diaryPDF")

//        let pdfData = try PDFGenerator.generateData(document: pdf, progress: { progress in
//            print(progress)
//        }, debug: false)

        do {
            try PDFGenerator.generate(document: pdf, to: endUrl, progress: { (succes) in
                print(succes)
            }, debug: false)
        } catch {
            print(error)
        }


//        do {
//            try pdfData.write(to: endUrl, options: .atomicWrite)
//        } catch {
//            print(error)
//        }
    }

//    private func setUpPDFTop(pdf: SimplePDF) {
//        //TODO: add image
//        pdf.addVerticalSpace(30)
//        pdf.addLineSeparator(height: 2)
//    }
//
//    private func setUpPDStatistics() {
//
//    }

//    private func setUpPDFBody(entry: DiaryEntry, pdf: SimplePDF) {
//
//        switch entry.type {
//        case .anxiety:
//            pdf.addText("Intensiteit")
//
//        case .depression:
//        case .ruminating:
//        case .sleep:
//        case .stress:
//
//        default:
//            <#code#>
//        }
//    }

}

