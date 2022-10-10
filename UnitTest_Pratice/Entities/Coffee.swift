//
//  Coffee.swift
//  UnitTest_Pratice
//
//  Created by ByungHoon Ann on 2022/10/10.
//

import Foundation

struct Coffee: Decodable {
    let title: String
    let description: String
    let ingredients: [String]
    let id: Int
}
