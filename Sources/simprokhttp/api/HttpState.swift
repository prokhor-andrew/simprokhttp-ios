//
//  HttpState.swift
//
//
//  Created by Andriy Prokhorenko on 18.10.2022.
//


public struct HttpState {
    
    public let base: HttpUrl
    public let headers: Set<HttpHeader>
    public let timeoutInMillis: Int
    
    
    public init(
        base: HttpUrl,
        headers: Set<HttpHeader>,
        timeoutInMillis: Int
    ) {
        self.base = base
        self.headers = headers
        self.timeoutInMillis = timeoutInMillis
    }
}
