//
//  NetworkManager.swift
//  UnitTest_Pratice
//
//  Created by ByungHoon Ann on 2022/10/09.
//

import Foundation

final class NetworkManager {
    let session: URLSessionProtocol
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    func fetchData<T: Decodable>(for url: String,
                                 dataType: T.Type,
                                 compleion: @escaping((Result<T, Error>) -> Void)) {
        guard let url = URL(string: url) else { return }
        let dataTask: URLSessionDataTaskProtocol = session.dataTask(with: url) { data, response, error in
        //let dataTask: URLSessionDataTaskProtocol = session.dataTask(with: url) { data, response, error in
            if let error = error {
                compleion(.failure(error))
            }
            
            if let data = data,
               let response = response as? HTTPURLResponse,
               200..<400 ~= response.statusCode {
                do {
                    let data = try JSONDecoder().decode(T.self, from: data)
                    compleion(.success(data))
                } catch {
                    compleion(.failure(NetworkError.failToParse))
                }
            } else {
                compleion(.failure(NetworkError.invalid))
            }
        }
        dataTask.resume()
    }
}
