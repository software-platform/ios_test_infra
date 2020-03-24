//
//  AppUnderTestUITests.swift
//  AppUnderTestUITests
//
//  Created by Jaroslaw Gliwinski on 2020-03-24.
//  Copyright © 2020 Tooploox. All rights reserved.
//

import XCTest
import UITestWrapper

class AppUnderTestUITests: XCTestCase {

    var driver: Driver!

    override func setUp() {
        continueAfterFailure = false

        let app = XCUIApplication()
        app.launch()
        driver = DriverFactory.getDriver(for: app)
    }

    override func tearDown() {
        driver = nil
    }

    func testExample() {
        driver.get(elementTitled: "BUTTON").tap()
        XCTAssertTrue(driver.get(elementTitled: "CLICKED2").isVisible)
    }
}
