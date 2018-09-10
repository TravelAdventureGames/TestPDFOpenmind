//
//  StartVC.swift
//  PDFTesterOpenmind
//
//  Created by Martijn van Gogh on 09-09-18.
//  Copyright © 2018 Martijn van Gogh. All rights reserved.
//

import UIKit

class StartVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let helper = DiaryPDFHelper()
        let diaryEntries = helper.getDiaries()
        let generator = PDFGenerator(diaries: diaryEntries)
        generator.generatePDF(diaries: diaryEntries)

    }
    @IBAction func sendEmail(_ sender: Any) {
        let composer = PDFMailComposer()
        self.present(composer, animated: true, completion: nil)
    }
}
