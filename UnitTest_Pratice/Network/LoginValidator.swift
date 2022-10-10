//
//  LoginValidator.swift
//  UnitTest_Pratice
//
//  Created by ByungHoon Ann on 2022/09/24.
//

import Foundation

/// 자료출처: https://fomaios.tistory.com/entry/iOS-Unit-Test에-대해서-간단히-알아보기

class LoginValidator {
    func isValidEmail(email: String) -> Bool {
        return email.contains("@")
    }
    
    func isValidPassword(password: String) -> Bool {
        return password.count < 4
    }
}
