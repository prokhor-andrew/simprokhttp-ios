//
//  File.swift
//  
//
//  Created by Andriy Prokhorenko on 03.04.2023.
//

import Foundation


public struct HttpUpdateState {
    
    public let function: (HttpState) -> HttpState
    
    private init(_ function: @escaping (HttpState) -> HttpState) {
        self.function = function
    }
    
    public static func set(scheme: String) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: HttpUrl(scheme: scheme, host: state.base.host, pathPrefix: state.base.pathPrefix),
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(host: String) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: HttpUrl(scheme: state.base.scheme, host: host, pathPrefix: state.base.pathPrefix),
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(pathPrefix: String) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: HttpUrl(scheme: state.base.scheme, host: state.base.host, pathPrefix: pathPrefix),
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(headers: Set<HttpHeader>) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func insert(headers: Set<HttpHeader>) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers.union(headers),
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func insert(header: HttpHeader) -> HttpUpdateState {
        insert(headers: [header])
    }
    
    public static func remove(headers: Set<HttpHeader.Name>) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers.filter { !headers.contains($0.name) },
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func remove(header: HttpHeader.Name) -> HttpUpdateState {
        remove(headers: [header])
    }
    
    public static func set(timeoutInMillis timeout: Int) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                timeoutInMillis: timeout,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(cachePolicy: URLRequest.CachePolicy) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(allowsCellularAccess: Bool) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(allowsExpensiveNetworkAccess: Bool) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(allowsConstrainedNetworkAccess: Bool) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(networkServiceType: URLRequest.NetworkServiceType) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(httpShouldUsePipelining: Bool) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(httpShouldSetCookies: Bool) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(httpCookieAcceptPolicy: HTTPCookie.AcceptPolicy) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: httpCookieAcceptPolicy,
                waitsForConnectivity: state.waitsForConnectivity
            )
        }
    }
    
    public static func set(waitsForConnectivity: Bool) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                timeoutInMillis: state.timeoutInMillis,
                cachePolicy: state.cachePolicy,
                allowsCellularAccess: state.allowsCellularAccess,
                allowsExpensiveNetworkAccess: state.allowsExpensiveNetworkAccess,
                allowsConstrainedNetworkAccess: state.allowsConstrainedNetworkAccess,
                networkServiceType: state.networkServiceType,
                httpShouldUsePipelining: state.httpShouldUsePipelining,
                httpShouldSetCookies: state.httpShouldSetCookies,
                httpCookieAcceptPolicy: state.httpCookieAcceptPolicy,
                waitsForConnectivity: waitsForConnectivity
            )
        }
    }
    
    public static func custom(function: @escaping (HttpState) -> HttpState) -> HttpUpdateState {
        HttpUpdateState(function)
    }
}
