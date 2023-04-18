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
    public let cachePolicy: URLRequest.CachePolicy?
    public let timeoutInMillis: Int?

    
    public init(
        base: HttpUrl? = nil,
        path: HttpPath,
        method: HttpMethod,
        headers: Set<HttpHeader>? = nil,
        body: Data,
        cachePolicy: URLRequest.CachePolicy? = nil,
        timeoutInMillis: Int? = nil
    ) {
        self.base = base
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
        self.cachePolicy = cachePolicy
        self.timeoutInMillis = timeoutInMillis
    }
}
