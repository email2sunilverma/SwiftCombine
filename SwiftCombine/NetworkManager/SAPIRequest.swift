//
//  SAPIRequest.swift
//  SGeneralUtility
//
//  Created by Sunil Verma on 26/05/24.
//

import Foundation


public enum HTTPMethod: String {
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
    case patch   = "PATCH"
}



struct SNetworkError: Error {
    enum NetworkError: Error {
        case invalidUrl
        case invalidResponse
        case decodingError
        case noInternetConnect
        case tokenExpired
        case refereshTokenExpired
    }
    
    let error: NetworkError
    let data: Any?
}

public struct APIRequest {
    var baseURL: String = ""
    var path: String
    var method: HTTPMethod
    var headers: [String: String]
    var queryParams: [String: Any]
    var params: [String: Any]
    var token: String?
    var encodeURL: Bool
    var timeoutInterval: Int = 60
    
    init(baseURL: String = "",
         path: String,
         method: HTTPMethod,
         headers: [String: String] = [:],
         queryParams: [String: Any] = [:],
         params: [String: Any] = [:],
         token: String? = nil) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.headers = headers
        self.queryParams = queryParams
        self.params = params
        self.token = token
        self.encodeURL = true
    }
    
    func constructURLRequest() -> URLRequest {
        let url = ((baseURL != "" ? baseURL : SEnvironment.shared.getTheBaseURL()) + path).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        var components = URLComponents()
        components.scheme = "https"
        components.path = "/" + path
        components.queryItems = [URLQueryItem]()
        for (key, value) in queryParams {
            if let arrayData = value as? [Any] {
                for item in arrayData {
                    let queryItem = URLQueryItem(name: key, value: item as? String)
                    components.queryItems!.append(queryItem)
                }
            }else {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                components.queryItems!.append(queryItem)
            }
        }
        var urlRequest = URLRequest(url: URL(string: components.url == nil ? url : components.url?.absoluteString ?? "")!, timeoutInterval: TimeInterval(timeoutInterval))
        var newHeaders: [String: String] = [:]
        if headers.count != 0 {
            newHeaders = headers
        } else {
            newHeaders = ["Content-Type": "application/json"]
        }
        #warning("Additional Header setup should be done here, like access_token or others")
        urlRequest.allHTTPHeaderFields = newHeaders
        if method == .post || method == .patch || method == .put {
            
            if !params.isEmpty {
                let postData = try? JSONSerialization.data(withJSONObject: params , options: [])
                urlRequest.httpBody = postData
            }
        }
        urlRequest.httpMethod = method.rawValue
        return urlRequest
    }
}
