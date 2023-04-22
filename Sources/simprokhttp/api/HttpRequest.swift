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
    public let allowsExpensiveNetworkAccess: Bool?
    public let allowsConstrainedNetworkAccess: Bool?
    public let networkServiceType: URLRequest.NetworkServiceType?
    public let httpShouldUsePipelining: Bool?
    public let httpShouldSetCookies: Bool?
    public let httpCookieAcceptPolicy: HTTPCookie.AcceptPolicy?
    public let waitsForConnectivity: Bool?
    
    public init(
        base: HttpUrl? = nil,
        path: HttpPath,
        method: HttpMethod,
        headers: Set<HttpHeader>? = nil,
        body: Data,
        timeoutInMillis: Int? = nil,
        cachePolicy: URLRequest.CachePolicy? = nil,
        allowsCellularAccess: Bool? = nil,
        allowsExpensiveNetworkAccess: Bool? = nil,
        allowsConstrainedNetworkAccess: Bool? = nil,
        networkServiceType: URLRequest.NetworkServiceType? = nil,
        httpShouldUsePipelining: Bool? = nil,
        httpShouldSetCookies: Bool? = nil,
        httpCookieAcceptPolicy: HTTPCookie.AcceptPolicy? = nil,
        waitsForConnectivity: Bool? = nil
    ) {
        self.base = base
        self.path = path
        self.method = method
        self.headers = headers
        self.body = body
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


//config.shouldUseExtendedBackgroundIdleMode = false // -
//config.sessionSendsLaunchEvents = true // -
//config.multipathServiceType = .interactive // -
//config.isDiscretionary = true // -
//config.httpMaximumConnectionsPerHost = 5 // -
//config.connectionProxyDictionary = [:] // -
