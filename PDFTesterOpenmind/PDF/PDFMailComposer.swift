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

    // MARK: Fetches pdf from local storage and sends it as attachments via email
    public func sendMailWithPDFAttachment() {
        if (MFMailComposeViewController.canSendMail()) {

            let directory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let fileUrl = URL(fileURLWithPath: directory)
            let endUrl = fileUrl.appendingPathComponent("diaryPDF")
            let data = NSData(contentsOf: endUrl)

            let composer = MFMailComposeViewController()
            composer.mailComposeDelegate = self
            composer.setSubject("Mijn dagboeken")
            composer.setToRecipients(["martijn@traveladventuregames.nl"])
            composer.addAttachmentData(data! as Data, mimeType: "application/pdf", fileName: "diaryPDF")
            self.present(composer, animated: true, completion: nil)
            return
        }
    }
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?){
        self.dismiss(animated: true, completion: nil)
    }

}


