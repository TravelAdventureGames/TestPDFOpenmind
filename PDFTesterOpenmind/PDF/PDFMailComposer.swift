//
//  PDFMailComposer.swift
//  PDFTesterOpenmind
//
//  Created by Martijn van Gogh on 09-09-18.
//  Copyright © 2018 Martijn van Gogh. All rights reserved.
//

import Foundation
import MessageUI

class PDFMailComposer: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        sendMailWithPDFAttachment()
    }

    public func sendMailWithPDFAttachment() {
        if (MFMailComposeViewController.canSendMail()) {

            if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] {
                print(directory)
                let data = NSData(contentsOf: directory)
                let composer = MFMailComposeViewController()
                composer.mailComposeDelegate = self
                composer.setSubject("Mijn dagboeken")
                composer.setToRecipients(["martijn@traveladventuregames.nl"])
                composer.addAttachmentData(data! as Data, mimeType: "application/pdf", fileName: "diaryPDF.pdf")
                self.present(composer, animated: true, completion: nil)
                return
            }
        }
    }
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        self.dismiss(animated: true, completion: nil)
        print("send!")
    }

}


