//
//  URLSessionDataTaskProtocol.swift
//  UnitTest_Pratice
//
//  Created by ByungHoon Ann on 2022/10/10.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }
