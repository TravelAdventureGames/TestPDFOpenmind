//
//  DateFormatter.swift
//  PDFTesterOpenmind
//
//  Created by Martijn van Gogh on 17-09-18.
//  Copyright © 2018 Martijn van Gogh. All rights reserved.
//

import UIKit

//MARK: DO NOT COPY THIS CLASS -> it's allreay in OpenMind original project

private let dateFormatter: DateFormatter = {
    let formater = DateFormatter()
    formater.locale = Locale.current
    return formater
}()

extension Date {

    func toLongString() -> String {
        assert(Thread.isMainThread)
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }

    func toMediumString() -> String {
        assert(Thread.isMainThread)
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self)
    }

    func toShortString() -> String {
        assert(Thread.isMainThread)
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.date
        return dateFormatter.string(from: self)
    }

    func toString(dateFormat format: String ) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
