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
    public let timeoutInMillis: Int
    public let cachePolicy: URLRequest.CachePolicy
    public let allowsCellularAccess: Bool
    public let isEphemeral: Bool
    
    
    public init(
        base: HttpUrl,
        headers: Set<HttpHeader>,
        timeoutInMillis: Int,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        allowsCellularAccess: Bool = true,
        isEphemeral: Bool = false
    ) {
        self.base = base
        self.headers = headers
        self.timeoutInMillis = timeoutInMillis
        self.cachePolicy = cachePolicy
        self.allowsCellularAccess = allowsCellularAccess
        self.isEphemeral = isEphemeral
    }
}
