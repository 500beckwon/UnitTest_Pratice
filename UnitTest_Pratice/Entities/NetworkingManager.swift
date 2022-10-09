//
//  NetworkingManager.swift
//  UnitTest_Pratice
//
//  Created by ByungHoon Ann on 2022/10/09.
//

import Foundation

extension URLSession: URLSessionProtocol { }

protocol URLSessionProtocol {
    func dataTask(with url: URL,completionHandler: @escaping((Data?, URLResponse?, Error?) -> Void)) -> URLSessionDataTask
}

final class NetworkingManager {
    let session:  URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
}

class MockURLSession: URLSessionProtocol {
    typealias Response = (data: Data?, response: URLResponse?, error: Error?)
    
    let response: Response
    
    init(response: Response) {
        self.response = response
    }
    
    
    func dataTask(with url: URL, completionHandler: @escaping ((Data?, URLResponse?, Error?) -> Void)) -> URLSessionDataTask {
        return MockURLSessionDataTask(resumeHandler: {
            completionHandler(self.response.data,
                              self.response.response,
                              self.response.error)
        })
    }
}

protocol URLSessionDataTaskProtocol {
    func resume()
}

class MockURLSessionDataTask: URLSessionDataTask {
    private let resumeHandler: () -> Void
    
    init(resumeHandler: @escaping () -> Void) {
        self.resumeHandler = resumeHandler
    }
    
    override func resume() {
        resumeHandler()
    }

}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }
