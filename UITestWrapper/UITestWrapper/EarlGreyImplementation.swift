//
//  EarlGreyImplementation.swift
//  UITestWrapper
//
//  Created by Jaroslaw Gliwinski on 2020-03-24.
//  Copyright © 2020 Tooploox. All rights reserved.
//

import Foundation

struct PlaceholderElement: Element {

    var title: String = "X"
    var isVisible: Bool = true

    func tap() { fatalError("Not implemented") }
}

struct EarlGreyDriver: Driver {

    func get(elementTitled title: String) -> Element {
        EarlGrey.selectElement(with: grey_buttonTitle("BUTTON"))
        return PlaceholderElement()
    }
}

