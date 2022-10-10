//
//  Evan.swift
//  UnitTest_Pratice
//
//  Created by ByungHoon Ann on 2022/09/24.
//

import Foundation

struct Even {
    let number: Int
    var isEvan: Bool {
        get {
            return number % 2 == 0
        }
    }
}
