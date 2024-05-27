//
//  SNetworkManager.swift
//  SwiftCombine
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation
import Combine
class SNetworkManager {
    public static let shared = SNetworkManager()
    private var concelable  = Set<AnyCancellable>()
    private lazy var urlSession: URLSession = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.timeoutIntervalForRequest = 30
        config.urlCache = nil
        return URLSession(configuration: config)
    }()
    
    private init() {}
    
    func performRequest<T: Decodable>(apiRequest: APIRequest, type: T.Type) -> Future<T, Error> {
        return Future { promis in
            self.urlSession.dataTaskPublisher(for: apiRequest.constructURLRequest())
                .tryMap { (data, response) in
                    guard let httpsResponse = response as? HTTPURLResponse, 200...299 ~= httpsResponse.statusCode else {
                        throw SNetworkError(error: .invalidResponse, data: nil)
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { status in
                    switch status {
                    case .failure(let error):
                        let err = SNetworkError(error: .invalidResponse, data: nil)
                        promis(.failure(err))
                    case .finished:
                        print("Success")
                    }
                }, receiveValue: { data in
                    promis(.success(data))
                })
            
                .store(in: &self.concelable)
        }
    }
    
    func performRequest<T: Decodable>(url: URL, type: T.Type) -> Future<T, Error> {
        return Future { promis in
//            self.urlSession.dataTaskPublisher(for: apiRequest.constructURLRequest())
            self.urlSession.dataTaskPublisher(for: url)
                .tryMap { (data, response) in
                    guard let httpsResponse = response as? HTTPURLResponse, 200...299 ~= httpsResponse.statusCode else {
                        throw SNetworkError(error: .invalidResponse, data: nil)
                    }
                    return data
                }
                .decode(type: T.self, decoder: JSONDecoder())
                .receive(on: RunLoop.main)
                .sink(receiveCompletion: { status in
                    switch status {
                    case .failure(let error):
                        let err = SNetworkError(error: .invalidResponse, data: nil)
                        promis(.failure(err))
                    case .finished:
                        print("Success")
                    }
                }, receiveValue: { data in
                    promis(.success(data))
                })
            
                .store(in: &self.concelable)
        }
    }
}
