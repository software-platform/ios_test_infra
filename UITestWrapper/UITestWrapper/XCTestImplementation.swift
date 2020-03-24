//
//  XCTestImplementation.swift
//  UITestWrapper
//
//  Created by Jaroslaw Gliwinski on 2020-03-24.
//  Copyright © 2020 Tooploox. All rights reserved.
//

import Foundation
import XCTest

extension XCUIElement: Element {

    public var isVisible: Bool {
        return isHittable
    }
}

struct XCTestDriver: Driver {

    let application: XCUIApplication

    func get(elementTitled title: String) -> Element {
        let predicate = NSPredicate(
            format: "%K == %@", #keyPath(XCUIElement.label), title
        )

        return application
            .descendants(matching: .any)
            .element(matching: predicate)
    }
}
