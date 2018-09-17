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
        DiaryEntry(date: Date(), event: "Ik raakte in de stress toen ik het woord moest voeren in een meeting.Ik was echt verschrikkelijk gespannen, echt niet normaal. Het was een heel sombere dag en ik dacht'ik wil alleen maar terug in bed. Het", symptoms: [.gejaagd, .benauwdheid], thoughts: "Ik dacht dat ik door de grond zakte.", feelings: "Ik voelde me onzeker over de hele situatie. Wat moest i doen. Ik raakte toen in een soort apatische staat van bewustzijn.", intensity: 7.0, behavior: "Ik trok me terug en durfde niks te zeggen. Ik heb de hele vergadering geen woord meer durven uitbrengen. Ik vermeed deelname aan de meeting eigenlijk.", desiredThoughts: "Ik zou me op mijn gemak willen voelen", desiredBehavior: "Ik wilde dat ik wat assertiever kon zijn", type: .stress),
        DiaryEntry(date: Date(), event: "Ik was gisteren heel angstig, ik durfde de deur niet uit. Ik ben toen heel lang, tot 4 uur smiddags in mijn bed blijven liggen.", symptoms: [.gejaagd, .alcohol, .benauwdheid, .duizelig], thoughts: "Ik dacht 'ik ben helemaal niks waard, wie zit er op mij te wsachten. En daarvan kreeg ik nog meer sombere gedachten, als een soort viscueuze cirkel.", feelings: "Ik voelde me onzeker, bang en ook waardeloos. De gevoelens die ik had vroeger op het schoolplein kwamen weer helemaal terug.", intensity: 2.0, behavior: "Ik trok me terug en durfde niks te zeggen. Een soort 'cocooning was het, in de veilige omgeving van mijn bed met helemaal geen andere mensen om me heen die me konden raken.", desiredThoughts: "Ik zou me op mijn gemak willen voelen natuurlijk. Ik wil zin hebben in het leven, blij zijn en een klein beetje geluk ervaren.", desiredBehavior: "Ik wilde dat ik wat assertiever kon zijn. De straat op, een klein boodschapje doen, afspreken met vrienden. Iets wat voor andere mensen heel normaal linkt maar voor mij niet mogelijk.", type: .anxiety),
        DiaryEntry(date: Date(), event: "Ik was gisteren heel droevig, ik durfde de deur niet uit en was bang voor alle, het geluid van het koffiezetapparaat deed mijn hart bonzen in mijn keel.", symptoms: [.gejaagd, .alcohol, .benauwdheid, .duizelig], thoughts: "Ik was heel zweterig, dacht dat er alleen maar erge dingen met me konden gebeuren die dag. Dat ik een ongeluk zou krijgen of dat er een aanslag zou plaatsvinden waar ik dan op dat moment getuige van zou zijn.", feelings: "Ik voelde me onzeker en heel klein, bang in een grote wereld", intensity: 6.0, behavior: "Ik trok me terug en durfde niks te zeggen.", desiredThoughts: "Ik zou me op mijn gemak willen voelen. DIngen willen ondernemen zoals voor ieder mens volledig normaal is. Niet allerlei angstige gedachten ontwikkelen.", desiredBehavior: "Ik wilde dat ik wat assertiever kon zijn, ik zou niet gehainderd willen worden in mijn doen en laten op een dag. Gewoon met het leven meedoen zoals ieder mens. Een wandelingetje gaan maken bijvoorbeeld in Amsterdam Noord.", type: .anxiety),
        DiaryEntry(date: Date(), event: "Ik was gisteren heel angstig, ik durfde de deur niet uit", symptoms: [.gejaagd, .alcohol, .benauwdheid, .duizelig], thoughts: "Ik raakte gisteren volledig in paniek. Lorem Ipsum is de standaard proeftekst in deze bedrijfstak sinds de 16e eeuw, toen een onbekende drukker een zethaak met letters nam en ze door elkaar ", feelings: "Ik voelde me opgefokt. Het is al geruime tijd een bekend gegeven dat een lezer, tijdens het bekijken van de layout van een pagina, afgeleid wordt door de tekstuele inhoud.", intensity: 2.0, behavior: "Ik trok me terug en durfde niks te zeggen", desiredThoughts: "Ik zou me op mijn gemak willen voelen. Er zijn vele variaties van passages van Lorem Ipsum beschikbaar maar het merendeel heeft te lijden gehad van wijzigingen in een of andere vorm, door ingevoegde humor of willekeurig gekozen woorden die nog niet half geloofwaardig ogen.", desiredBehavior: "Ik wilde dat ik wat minder getroubleerd kon zijn", type: .ruminating),
        DiaryEntry(date: Date(), event: "Ik was gisteren heel down, ik durfde de deur niet uit", symptoms: [.gejaagd, .alcohol, .benauwdheid], thoughts: "Ik raakte gisteren volledig in een apathische houding", feelings: "Ik voelde me onzeker", intensity: 2.0, behavior: "Ik trok me terug en durfde niks te zeggen", desiredThoughts: "Ik zou me op mijn gemak willen voelen", desiredBehavior: "Ik wilde dat ik wat assertiever kon zijn", type: .depression)
    ]

    public func getDiaries() -> [DiaryEntry] {
        return DiaryPDFHelper.diaryPDFs
    }

}
