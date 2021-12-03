//
//  AstronomyModelTest.swift
//  AstroBrowserTests
//
//  Created by Khateeb H. on 12/3/21.
//

import Foundation
import XCTest
@testable import AstroBrowser


class AstronomyModelTest: XCTestCase {
    func testTitle() {
        let subject = Astronomy(title: "Test astro", explanation: "long description", date: "2022-01-01", url: URL(string: "https://apod.nasa.gov/apod/image/0703/m95_cfht.jpg")!)
        XCTAssertEqual(subject.title, "Test astro")
    }
}
