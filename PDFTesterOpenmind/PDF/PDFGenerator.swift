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

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func generatePDF(diaries: [DiaryEntry]) {

        let A4paperSize = CGSize(width: 595, height: 842)
        let pdf = SimplePDF(pageSize: A4paperSize)
        pdf.setContentAlignment(.left)
        pdf.addText("De Nations League. Het is een term die je de afgelopen maanden misschien wel vaker voorbij hebt zien komen. 'Iets met dat onbegrijpelijke toernooi wat geen EK is maar wel belangrijk', horen we je denken. Ingewikkeld is de opzet van de Nations League wel een beetje, maar na het lezen van dit artikel hopelijk niet meer!")

        let fileName = getDocumentsDirectory().appendingPathComponent("diaryPDF.pdf")
        let pdfData = pdf.generatePDFdata()
        do {
            try pdfData.write(to: fileName, options: .atomicWrite)
        } catch {
            print(error)
        }

//        let documentDirectories = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) {
//
//            let pdfData = pdf.generatePDFdata()
//            do {
//                let fileName = "diaryPDF.pdf"
//                let documentsFileName = URL(fileURLWithPath: documentDirectories + "/" + fileName)
//                try pdfData.write(to: documentsFileName, options: .atomicWrite)
//                print("\nThe generated pdf can be found at:")
//                print("\n\t\(documentsFileName)\n")
//            } catch {
//                print(error)
//            }
//        }
    }
}

