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
    public let allowsExpensiveNetworkAccess: Bool
    public let allowsConstrainedNetworkAccess: Bool
    public let networkServiceType: URLRequest.NetworkServiceType
    public let httpShouldUsePipelining: Bool
    public let httpShouldSetCookies: Bool
    public let httpCookieAcceptPolicy: HTTPCookie.AcceptPolicy
    public let waitsForConnectivity: Bool
    
    public init(
        base: HttpUrl,
        headers: Set<HttpHeader>,
        timeoutInMillis: Int,
        cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy,
        allowsCellularAccess: Bool = true,
        allowsExpensiveNetworkAccess: Bool = true,
        allowsConstrainedNetworkAccess: Bool = false,
        networkServiceType: NSURLRequest.NetworkServiceType = .default,
        httpShouldUsePipelining: Bool = false,
        httpShouldSetCookies: Bool = true,
        httpCookieAcceptPolicy: HTTPCookie.AcceptPolicy = .onlyFromMainDocumentDomain,
        waitsForConnectivity: Bool = false
    ) {
        self.base = base
        self.headers = headers
        self.timeoutInMillis = timeoutInMillis
        self.cachePolicy = cachePolicy
        self.allowsCellularAccess = allowsCellularAccess
        self.allowsExpensiveNetworkAccess = allowsExpensiveNetworkAccess
        self.allowsConstrainedNetworkAccess = allowsConstrainedNetworkAccess
        self.networkServiceType = networkServiceType
        self.httpShouldUsePipelining = httpShouldUsePipelining
        self.httpShouldSetCookies = httpShouldSetCookies
        self.httpCookieAcceptPolicy = httpCookieAcceptPolicy
        self.waitsForConnectivity = waitsForConnectivity
    }
}
