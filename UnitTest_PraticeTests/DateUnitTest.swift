//
//  DateUnitTest.swift
//  UnitTest_PraticeTests
//
//  Created by ByungHoon Ann on 2022/10/29.
//

import XCTest
@testable import UnitTest_Pratice

class DateUnitTest: XCTestCase {
    func testTimeAgoStrings() {
        let fiveMinsAgo = Date(timeIntervalSince1970: -300)
        let fineMinsAgoDisplay = fiveMinsAgo.timeAgoDisplay()
       XCTAssertEqual(fineMinsAgoDisplay, "5 mins ago")
    }
    
    func testHelloWorld() {
        var helloWorld: String?
        
        XCTAssertNil(helloWorld)
        helloWorld = "hello world"
        XCTAssertEqual(helloWorld, "hello world")
    }
    
    func testSqureInt() {
        let value = 3
        let squreValue = value.squre()
        XCTAssertEqual(squreValue, 3 * 3)
    }
}
