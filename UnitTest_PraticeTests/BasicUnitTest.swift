//
//  BasicUnitTest.swift
//  UnitTest_PraticeTests
//
//  Created by ByungHoon Ann on 2023/01/31.
//

import XCTest
@testable import UnitTest_Pratice

class BasicUnitTest: XCTestCase {
    var ferrari: Car!
    var jeep: Car!
    var honda: Car!
    
    // 초기화 코드를 작성하는 함수로 클래스의 각 테스트 함수의 호출 전에 호출되는 함수
    override func setUpWithError() throws {
        ferrari = Car(type: .Sport, transmissionMode: .Drive)
        jeep = Car(type: .OffRoad, transmissionMode: .Drive)
        honda = Car(type: .Economy, transmissionMode: .Park)
    }
    
    // 해체 코드를 작성하는 함수로 각 테스트 함수의 호출 후에 호출되는 함수
    override func tearDownWithError() throws {
        ferrari = nil
        jeep = nil
        honda = nil
    }
    
    func testSportFasterThanJeep() {
        let minutes = 60
        //1 start ferrari
        ferrari.start(minutes: minutes)
        //2 start jeep
        jeep.start(minutes: minutes)
        //Test it
        XCTAssertTrue(ferrari.miles > jeep.miles)
    }
    
    //테스트 케이스를 작성하는 함수로 테스트가 올바른 결과를 생성하는지 확인하는 함수
    func testExample() throws {
        
    }
    
    //성능 테스트 케이스를 작성하는 함수로 시간을 측정하는 코드를 작성하는 함수다
    func testPerformanceExample() throws {
        self.measure {
        }
    }
}
