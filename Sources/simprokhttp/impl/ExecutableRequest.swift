//
//  File 2.swift
//  
//
//  Created by Andriy Prokhorenko on 03.04.2023.
//

import Foundation

struct ExecutableRequest: Hashable {
    
    let url: URL
    let timeotInterval: TimeInterval
    let headers: [String: String]
    let body: Data
    let method: String
    let cachePolicy: URLRequest.CachePolicy
    let allowsCellularAccess: Bool
    let allowsExpensiveNetworkAccess: Bool
    let allowsConstrainedNetworkAccess: Bool
    let networkServiceType: NSURLRequest.NetworkServiceType
    let httpShouldUsePipelining: Bool
    let httpShouldSetCookies: Bool
    let httpCookieAcceptPolicy: HTTPCookie.AcceptPolicy
    let waitsForConnectivity: Bool
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: url)
        
        request.allowsCellularAccess = allowsCellularAccess
        request.cachePolicy = cachePolicy
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        request.timeoutInterval = timeotInterval
        request.networkServiceType = networkServiceType
        request.httpShouldUsePipelining = httpShouldUsePipelining
        request.httpShouldHandleCookies = httpShouldSetCookies
        
        if #available(macOS 10.15, *) {
            request.allowsExpensiveNetworkAccess = allowsExpensiveNetworkAccess
            request.allowsConstrainedNetworkAccess = allowsConstrainedNetworkAccess
        }
        
        
        return request
    }
}
