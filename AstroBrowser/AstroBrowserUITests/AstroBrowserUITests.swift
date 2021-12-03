//
//  AstroBrowserUITests.swift
//  AstroBrowserUITests
//
//  Created by Khateeb H. on 12/2/21.
//

import XCTest

class AstroBrowserUITests: XCTestCase {

    lazy var app = XCUIApplication()

    override func setUp() {
        super.setUp()

        continueAfterFailure = false
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTappingOneAstroAfterLoading() {
        let loaded = NSPredicate(format: "count > 0")
        expectation(for: loaded, evaluatedWith: app.collectionViews.element(boundBy: 0).cells, handler: nil)
        
        waitForExpectations(timeout: 15) { error in
            self.app.collectionViews.element(boundBy: 0).cells.element(boundBy: 0).tap()
        }
    }
}
