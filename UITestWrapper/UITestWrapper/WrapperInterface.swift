//
//  WrapperInterface.swift
//  UITestWrapper
//
//  Created by Jaroslaw Gliwinski on 2020-03-24.
//  Copyright © 2020 Tooploox. All rights reserved.
//

import Foundation
import XCTest

public protocol Element {
    var title: String { get }
    var isVisible: Bool { get }

    func tap()
}

public protocol Driver {
    func get(elementTitled title: String) -> Element
}

public struct DriverFactory {

    public static func getDriver(for application: XCUIApplication) -> Driver {
        return XCTestDriver(application: application)
    }
}
