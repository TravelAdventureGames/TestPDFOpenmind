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

        setUpPDFHeader(pdf: pdf)
        setNormalSubTitleText(text: "DAGBOEKAANTEKENINGEN", document: pdf)
        setUpPDStatistics(pdf: pdf, diaries: diaries)
        setupAllDiarySections(diaries: diaryEntries, pdf: pdf)

        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let fileUrl = URL(fileURLWithPath: documentsPath)
        let endUrl = fileUrl.appendingPathComponent("diaryPDF")

        do {
            try PDFGenerator.generate(document: pdf, to: endUrl, progress: { (succes) in
                print(succes)
            }, debug: false)
        } catch {
            // TODO: Create some alert to notify user pdf cannot be generated
            print(error)
        }
    }

    // Define fonts, textcolors, for texts
    private func setHeaderTitleText(text: String, document: PDFDocument) {
        let attributedTitle = NSMutableAttributedString(string: text, attributes: [
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 35),
            NSAttributedStringKey.foregroundColor : UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1.0) // change to mainThemeColor()
            ])
        document.addAttributedText(.headerCenter, text: attributedTitle)
    }

    private func setNormalTitleText(text: String, document: PDFDocument) {
        let attributedTitle = NSMutableAttributedString(string: text, attributes: [
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 25),
            NSAttributedStringKey.foregroundColor : UIColor(red: 70/255, green: 130/255, blue: 180/255, alpha: 1.0) // change to mainThemeColor()
            ])
        let textElement = PDFAttributedText(text: attributedTitle)
        document.addAttributedText(textObject: textElement)
    }

    private func setNormalSubTitleText(text: String, document: PDFDocument) {
        let attributedTitle = NSMutableAttributedString(string: text, attributes: [
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 20),
            NSAttributedStringKey.foregroundColor : UIColor(red: 173/255, green: 216/255, blue: 230/255, alpha: 1.0) // change to mainThemeSoftColor()
            ])
        let textElement = PDFAttributedText(text: attributedTitle)
        document.addAttributedText(textObject: textElement)
    }

    private func setNormalText(text: String, document: PDFDocument) {
        let attributedTitle = NSMutableAttributedString(string: text, attributes: [
            NSAttributedStringKey.font : UIFont.systemFont(ofSize: 14),
            NSAttributedStringKey.foregroundColor : UIColor.black
            ])
        let textElement = PDFAttributedText(text: attributedTitle)
        document.addAttributedText(textObject: textElement)
    }

    private func setBoldText(text: String, document: PDFDocument) {
        let attributedTitle = NSMutableAttributedString(string: text, attributes: [
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14),
            NSAttributedStringKey.foregroundColor : UIColor.black
            ])
        let textElement = PDFAttributedText(text: attributedTitle)
        document.addAttributedText(textObject: textElement)
    }

    // Set up containers
    private func setUpPDFHeader(pdf: PDFDocument) {
        let image: UIImage = #imageLiteral(resourceName: "LogoRondMiddel 1")
        let imageElement = PDFImage(image: image, caption: nil, size: CGSize(width: 60, height: 60), sizeFit: .widthHeight, quality: 1.0, options: .compress)
        pdf.addImage(.headerCenter, image: imageElement)
        setHeaderTitleText(text: "OpenMind", document: pdf)
        addLineSeperator(pdf: pdf)
    }

    private func setUpPDStatistics(pdf: PDFDocument, diaries: [DiaryEntry]) {
        let statisticsCalulator = PDFLayoutAssembler(diaries: diaries)
        pdf.addSpace(space: 20)
        pdf.addText(text: "Gemiddelde intensiteit:")
        pdf.addText(text: "Slapeloosheid: \(statisticsCalulator.getAverageIntensityFor(type: .sleep, diaries: diaries)) uur slaap")
        pdf.addText(text: "Stress: \(statisticsCalulator.getAverageIntensityFor(type: .stress, diaries: diaries))")
        pdf.addText(text: "Angst: \(statisticsCalulator.getAverageIntensityFor(type: .anxiety, diaries: diaries))")
        pdf.addText(text: "Depressie: \(statisticsCalulator.getAverageIntensityFor(type: .depression, diaries: diaries))")
        pdf.addText(text: "Piekeren: \(statisticsCalulator.getAverageIntensityFor(type: .ruminating, diaries: diaries))")
        pdf.addSpace(space: 30)
    }

    private func setupAllDiarySections(diaries: [DiaryEntry], pdf: PDFDocument) {
        let assembler = PDFLayoutAssembler(diaries: diaries)
        setupDiarySections(filteredEntries: assembler.getSelectedDiariesFor(type: .anxiety), pdf: pdf)
        setupDiarySections(filteredEntries: assembler.getSelectedDiariesFor(type: .ruminating), pdf: pdf)
        setupDiarySections(filteredEntries: assembler.getSelectedDiariesFor(type: .stress), pdf: pdf)
        setupDiarySections(filteredEntries: assembler.getSelectedDiariesFor(type: .depression), pdf: pdf)
        setupDiarySections(filteredEntries: assembler.getSelectedDiariesFor(type: .sleep), pdf: pdf)
    }

    private func setupDiarySections(filteredEntries: [DiaryEntry], pdf: PDFDocument) {
        if filteredEntries.isEmpty == false {
            getDiaryHeaderTitle(type: (filteredEntries.first?.type)!, pdf: pdf)
            for entry in filteredEntries {
                setUpPDFBody(entry: entry, pdf: pdf)
            }
        }
    }

    private func setUpPDFBody(entry: DiaryEntry, pdf: PDFDocument) {
        switch entry.type {
        case .anxiety:
            setBoldText(text: "Datum: \(entry.date.toMediumString())", document: pdf)
        case .depression:
            setBoldText(text: "Datum: \(entry.date.toMediumString())", document: pdf)
        case .ruminating:
            setBoldText(text: "Datum: \(entry.date.toMediumString())", document: pdf)
        case .sleep:
            setBoldText(text: "Datum: \(entry.date.toMediumString())", document: pdf)
        case .stress:
            setBoldText(text: "Datum: \(entry.date.toMediumString())", document: pdf)
        }
        pdf.addSpace(space: 20)
        addDottedLineSeperator(pdf: pdf)
    }

    // set up convenience methods
    private func addLineSeperator(pdf: PDFDocument) {
        let line = PDFLineStyle(type: .full, color: .black, width: 0.5, radius: 0)
        pdf.addLineSeparator(style: line)
    }

    private func addDottedLineSeperator(pdf: PDFDocument) {
        let line = PDFLineStyle(type: .dotted, color: .black, width: 0.5, radius: 0)
        pdf.addLineSeparator(style: line)
    }

    private func getDiaryHeaderTitle(type: DiaryType, pdf: PDFDocument) {
        addLineSeperator(pdf: pdf)
        switch type {
        case .anxiety:
            setNormalSubTitleText(text: "Angst-dagboeken", document: pdf)
        case .depression:
            setNormalSubTitleText(text: "Depressie-dagboeken", document: pdf)
        case .ruminating:
            setNormalSubTitleText(text: "Pieker-dagboeken", document: pdf)
        case .sleep:
            setNormalSubTitleText(text: "Slaap-dagboeken", document: pdf)
        case .stress:
            setNormalSubTitleText(text: "Stress-dagboeken", document: pdf)
        }
        pdf.addSpace(space: 20)
        addLineSeperator(pdf: pdf)
    }
}

