//
//  HttpState.swift
//
//
//  Created by Andriy Prokhorenko on 18.10.2022.
//

import Foundation

public struct HttpState {
    
    public let base: HttpUrl
    public let headers: Set<HttpHeader>
    public let cachePolicy: URLRequest.CachePolicy
    public let timeoutInMillis: Int
    
    
    public init(
        base: HttpUrl,
        headers: Set<HttpHeader>,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        timeoutInMillis: Int
    ) {
        self.base = base
        self.headers = headers
        self.cachePolicy = cachePolicy
        self.timeoutInMillis = timeoutInMillis
    }
}
