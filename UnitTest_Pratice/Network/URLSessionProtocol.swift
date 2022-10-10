//
//  URLSessionProtocol.swift
//  UnitTest_Pratice
//
//  Created by ByungHoon Ann on 2022/10/10.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with url: URL,completionHandler: @escaping((Data?, URLResponse?, Error?) -> Void)) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) -> URLSessionDataTaskProtocol {
        return dataTask(with: url, completionHandler: completionHandler) as URLSessionDataTask
    }
}
