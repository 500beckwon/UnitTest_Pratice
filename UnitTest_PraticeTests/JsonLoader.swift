//
//  JsonLoader.swift
//  UnitTest_PraticeTests
//
//  Created by ByungHoon Ann on 2022/10/10.
//

import Foundation

private enum JsonLoaderError: Error {
    case unknownFile
    case dataConvertFail
    case notJsonData
    case decodeFail
}

final class JsonLoader {
    static func load<T: Decodable>(type: T.Type, fileName: String) -> T? {
        do {
            let fileURL = try fileURL(of: fileName)
            let data = try fileData(of: fileURL)
            try checkIsJsonData(of: data)
            let decodeData = try decode(of: data, to: type)
            return decodeData
        } catch {
            loggingError(of: error)
            return nil
        }
    }
    
    static func data(fileName: String) -> Data? {
        do {
            let fileURL = try fileURL(of: fileName)
            let data = try fileData(of: fileURL)
            return data
        } catch {
            loggingError(of: error)
            return nil
        }
    }
    
    private static func fileURL(of fileName: String) throws -> URL {
        let testBundle = Bundle(for: self)
        let filePath = testBundle.path(forResource: fileName, ofType: "json")
        guard let filePath = filePath else {
            throw JsonLoaderError.unknownFile
        }
        let fileURL = URL(fileURLWithPath: filePath)
        return fileURL
    }
    
    private static func fileData(of fileURL: URL) throws -> Data {
        guard let data = try? Data(contentsOf: fileURL) else {
            throw JsonLoaderError.dataConvertFail
        }
        return data
    }
    
    private static func checkIsJsonData(of data: Data) throws {
        guard let _ = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) else {
            throw JsonLoaderError.notJsonData
        }
    }
    
    private static func decode<T: Decodable>(of data: Data, to type: T.Type) throws -> T {
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw JsonLoaderError.decodeFail
        }
        return decodedData
    }
    
    private static func loggingError(of error: Error) {
        switch error {
        case JsonLoaderError.unknownFile:
            print("???? file ??? ?????? ??? ?????????")
        case JsonLoaderError.dataConvertFail:
            print("???? file ??? ?????? ????????? data ??? ????????? ??? ?????????")
        case JsonLoaderError.notJsonData:
            print("???? file data ??? json ????????? ????????????. ????????? ????????? ??????????????????")
        case JsonLoaderError.decodeFail:
            print("???? json ???????????? ?????????. type ??? ??????????????????")
        default:
            print("???? ?????? ?????? \(error.localizedDescription)")
        }
    }
}
