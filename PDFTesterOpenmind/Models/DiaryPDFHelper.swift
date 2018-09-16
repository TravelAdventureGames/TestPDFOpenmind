//
//  DiaryPDFHelper.swift
//  PDFTesterOpenmind
//
//  Created by Martijn van Gogh on 27-08-18.
//  Copyright © 2018 Martijn van Gogh. All rights reserved.
//

import Foundation
import UIKit



class DiaryPDFHelper {

    static var diaryPDFs: [DiaryEntry] = [
        DiaryEntry(date: Date(), event: "Ik raakte in de stress toen ik het woord moest voeren in een meeting.", symptoms: [.gejaagd, .benauwdheid], thoughts: "Ik dacht dat ik door de grond zakte.", feelings: "Ik voelde me onzeker", intensity: 7.0, behavior: "Ik trok me terug en durfde niks te zeggen", desiredThoughts: "Ik zou me op mijn gemak willen voelen", desiredBehavior: "Ik wilde dat ik wat assertiever kon zijn", type: .stress),
        DiaryEntry(date: Date(), event: "Ik was gisteren heel angstig, ik durfde de deur niet uit", symptoms: [.gejaagd, .alcohol, .benauwdheid, .duizelig], thoughts: "Ik rakte gisteren volledig in paniek", feelings: "Ik voelde me onzeker", intensity: 2.0, behavior: "Ik trok me terug en durfde niks te zeggen", desiredThoughts: "Ik zou me op mijn gemak willen voelen", desiredBehavior: "Ik wilde dat ik wat assertiever kon zijn", type: .anxiety),
        DiaryEntry(date: Date(), event: "Ik was gisteren heel angstig, ik durfde de deur niet uit", symptoms: [.gejaagd, .alcohol, .benauwdheid, .duizelig], thoughts: "Ik rakte gisteren volledig in paniek", feelings: "Ik voelde me onzeker", intensity: 6.0, behavior: "Ik trok me terug en durfde niks te zeggen", desiredThoughts: "Ik zou me op mijn gemak willen voelen", desiredBehavior: "Ik wilde dat ik wat assertiever kon zijn", type: .anxiety),
        DiaryEntry(date: Date(), event: "Ik was gisteren heel angstig, ik durfde de deur niet uit", symptoms: [.gejaagd, .alcohol, .benauwdheid, .duizelig], thoughts: "Ik rakte gisteren volledig in paniek", feelings: "Ik voelde me opgefokt", intensity: 2.0, behavior: "Ik trok me terug en durfde niks te zeggen", desiredThoughts: "Ik zou me op mijn gemak willen voelen", desiredBehavior: "Ik wilde dat ik wat minder getroubleerd kon zijn", type: .ruminating),
        DiaryEntry(date: Date(), event: "Ik was gisteren heel down, ik durfde de deur niet uit", symptoms: [.gejaagd, .alcohol, .benauwdheid], thoughts: "Ik raakte gisteren volledig in een apathische houding", feelings: "Ik voelde me onzeker", intensity: 2.0, behavior: "Ik trok me terug en durfde niks te zeggen", desiredThoughts: "Ik zou me op mijn gemak willen voelen", desiredBehavior: "Ik wilde dat ik wat assertiever kon zijn", type: .depression)
    ]

    public func getDiaries() -> [DiaryEntry] {
        return DiaryPDFHelper.diaryPDFs
    }

}
