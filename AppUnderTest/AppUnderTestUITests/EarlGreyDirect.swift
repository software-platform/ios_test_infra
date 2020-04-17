//
//  EarlGreyDirect.swift
//  AppUnderTestUITests
//
//  Created by Jaroslaw Gliwinski on 2020-03-24.
//  Copyright © 2020 Tooploox. All rights reserved.
//

import XCTest
import EarlGreySwift

class EarlGreyDirect: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false


        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let app = XCUIApplication()
        app.launch()

        EarlGreyAccess
            .selectElement(with: grey_buttonTitle("BUTTON"))
            .perform(grey_tap())

        XCTAssertTrue(app.buttons.firstMatch.staticTexts.firstMatch.label == "CLICKED")
    }

}
