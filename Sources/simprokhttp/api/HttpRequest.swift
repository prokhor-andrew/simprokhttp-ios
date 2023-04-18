//
//  File.swift
//  
//
//  Created by Andriy Prokhorenko on 03.04.2023.
//

import Foundation


public struct HttpRequest {
    
    public let base: HttpUrl?
    public let path: HttpPath
    public let method: HttpMethod
    public let headers: Set<HttpHeader>?
    public let body: Data
    public let timeoutInMillis: Int?
    public let cachePolicy: URLRequest.CachePolicy?
    public let allowsCellularAccess: Bool?

    
    public init(
        base: HttpUrl? = nil,
        path: HttpPath,
        method: HttpMethod,
        headers: Set<HttpHeader>? = nil,
        body: Data,
        timeoutInMillis: Int? = nil,
        cachePolicy: URLRequest.CachePolicy? = nil,
        allowsCellularAccess: Bool? = nil
    ) {
        self.base = base
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
        self.timeoutInMillis = timeoutInMillis
        self.cachePolicy = cachePolicy
        self.allowsCellularAccess = allowsCellularAccess
    }
}
