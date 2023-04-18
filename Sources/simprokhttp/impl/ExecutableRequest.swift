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
    
    
    var urlRequest: URLRequest {
        var request = URLRequest(url: url)
        
        request.cachePolicy = cachePolicy
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        request.httpBody = body
        request.timeoutInterval = timeotInterval
        
        return request
    }
}
