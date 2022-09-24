//
//  UnitTest_PraticeTests.swift
//  UnitTest_PraticeTests
//
//  Created by ByungHoon Ann on 2022/09/24.
//
/// 참고자료1 : https://velog.io/@chagmn/Unit-Test-사용해보기
/// 참고자료2 : https://fomaios.tistory.com/entry/iOS-Unit-Test에-대해서-간단히-알아보기

/*
테스트를 하는 메소드의 이름을 작성하는 방법
 
1. 앞에 test를 붙이고 테스트를 할 클래스 이름을 적어준다.
2. 테스트를 할 상황에 대해 설명한다.
3. 예상되는 결과를 적어준다.
 
*/

import XCTest
@testable import UnitTest_Pratice

class UnitTest_PraticeTests: XCTestCase {
    
    var systenUnderTest: LoginValidator!
    
    // 초기화 코드를 작성하는 함수로 클래스의 각 테스트 함수의 호출 전에 호출되는 함수
    override func setUpWithError() throws {
        systenUnderTest = LoginValidator()
    }
    
    // 해체 코드를 작성하는 함수로 각 테스트 함수의 호출 후에 호출되는 함수
    override func tearDownWithError() throws {
        systenUnderTest = nil
    }

    //테스트 케이스를 작성하는 함수로 테스트가 올바른 결과를 생성하는지 확인하는 함수
    func testExample() throws {

    }
    
    //성능 테스트 케이스를 작성하는 함수로 시간을 측정하는 코드를 작성하는 함수다
    func testPerformanceExample() throws {
        self.measure {
        }
    }
    
    func testEven() {
        let number = Even(number: 1020)
        XCTAssertTrue(number.isEvan)
    }
    
    func testLoginValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        //let email = "kjsx50@naver.com"
        let email = "kjsx50naver.com"
        let user = User(email: email, password: "kjsx50")
        let isValidEmail = systenUnderTest.isValidEmail(email: user.email)
        XCTAssertTrue(isValidEmail)
    }

}
