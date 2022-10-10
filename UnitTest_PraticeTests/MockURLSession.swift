//
//  MockURLSession.swift
//  UnitTest_PraticeTests
//
//  Created by ByungHoon Ann on 2022/10/10.
//

import Foundation
@testable import UnitTest_Pratice

class MockURLSession: URLSessionProtocol {

    typealias Response = (data: Data?, urlResponse: URLResponse?, error: Error?)
    
    let response: Response
    
    init(response: Response) {
        self.response = response
    }
    
    func dataTask(with url: URL,
                  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return MockURLSessionDataTask(resumeHandler: {
            completionHandler(self.response.data,
                              self.response.urlResponse,
                              self.response.error)
        })
    }
    
    static func make(url: String, data: Data?, statusCode: Int) -> MockURLSession {
        let mockURLSession: MockURLSession = {
            let urlResponse = HTTPURLResponse(url: URL(string: url)!,
                                           statusCode: statusCode,
                                           httpVersion: nil,
                                           headerFields: nil)
            let mockResponse: MockURLSession.Response = (data: data,
                                                         urlResponse: urlResponse,
                                                         error: nil)
            let mockUrlSession = MockURLSession(response: mockResponse)
            return mockUrlSession
        }()
        return mockURLSession
    }
}
