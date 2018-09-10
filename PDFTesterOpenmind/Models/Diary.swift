//
//  Diary.swift
//  PDFTesterOpenmind
//
//  Created by Martijn van Gogh on 27-08-18.
//  Copyright © 2018 Martijn van Gogh. All rights reserved.
//

import Foundation
import UIKit

enum DiaryType: Int {
    case sleep
    case stress
    case anxiety
    case depression
    case ruminating

    var title: String {
        switch self {
        case .anxiety:
            return "anxiety title"
        case .depression:
            return "depression title"
        case .ruminating:
            return "Ruminating title"
        case .sleep:
            return "Sleep title"
        case .stress:
            return "Stress title"
        }
    }
}

enum Symptom: Int {
    case gejaagd
    case prikkelbaar
    case ademhaling
    case piekeren
    case hartkloppingen
    case kortademig
    case duizelig
    case benauwdheid
    case misselijk
    case onwerkelijkheid
    case tinteling
    case beven
    case zweten
    case slap
    case somber
    case niks
    case slapen
    case leegte
    case energie
    case concentratie
    case huilbuien
    case besluiteloosheid
    case traagheid
    case gewicht
    case vergeetachtig
    case lontje
    case alcohol
    case koffie

    var text: String {
        switch self {
        case .gejaagd:
            return "Gejaagd gevoel"
        case .prikkelbaar:
            return "Prikkelbaar"
        case .ademhaling:
            return "Snellere ademhaling"
        case .piekeren:
            return "Piekeren"
        case .hartkloppingen:
            return "Hartkloppingen"
        case .kortademig:
            return "Kortademig"
        case .duizelig:
            return "Duizelig/flauw vallen"
        case .benauwdheid:
            return "Benauwdheid"
        case .misselijk:
            return "Misselijk"
        case .onwerkelijkheid:
            return "Gevoel van onwerkelijkheid"
        case .tinteling:
            return "Tinteling"
        case .beven:
            return "Beven trillen"
        case .zweten:
            return "Zweten"
        case .slap:
            return "Slappe benen"
        case .somber:
            return "Somber"
        case .niks:
            return"Niks doen"
        case .slapen:
            return "Meer/ minder slapen"
        case .leegte:
            return "Gevoel van leegte"
        case .energie:
            return "Geen energie"
        case .concentratie:
            return "Concentratieproblemen"
        case .huilbuien:
            return "Huilbuien"
        case .besluiteloosheid:
            return "Besluiteloosheid"
        case .traagheid:
            return "Traagheid"
        case .gewicht:
            return "Aankomen/ afvallen"
        case .vergeetachtig:
            return "Vergeetachtig"
        case .lontje:
            return "Kort lontje"
        case .alcohol:
            return "Meer alcohol drinken"
        case .koffie:
            return "Meer koffie drinken"
        }
    }
}


struct DiaryEntry {
    let event: String?
    let symptoms: [Symptom]
    let thoughts: String?
    let feelings: String?
    let intensity: Float?
    let behavior: String?
    let desiredThoughts: String?
    let desiredBehavior: String?
    let type: DiaryType
}
