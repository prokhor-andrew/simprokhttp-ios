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
                cachePolicy: state.cachePolicy,
                timeoutInMillis: state.timeoutInMillis
            )
        }
    }
    
    public static func set(host: String) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: HttpUrl(scheme: state.base.scheme, host: host, pathPrefix: state.base.pathPrefix),
                headers: state.headers,
                cachePolicy: state.cachePolicy,
                timeoutInMillis: state.timeoutInMillis
            )
        }
    }
    
    public static func set(pathPrefix: String) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: HttpUrl(scheme: state.base.scheme, host: state.base.host, pathPrefix: pathPrefix),
                headers: state.headers,
                cachePolicy: state.cachePolicy,
                timeoutInMillis: state.timeoutInMillis
            )
        }
    }
    
    public static func set(headers: Set<HttpHeader>) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: headers,
                cachePolicy: state.cachePolicy,
                timeoutInMillis: state.timeoutInMillis
            )
        }
    }
    
    public static func insert(headers: Set<HttpHeader>) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers.union(headers),
                cachePolicy: state.cachePolicy,
                timeoutInMillis: state.timeoutInMillis
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
                cachePolicy: state.cachePolicy,
                timeoutInMillis: state.timeoutInMillis
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
                cachePolicy: state.cachePolicy,
                timeoutInMillis: timeout
            )
        }
    }
    
    public static func set(cachePolicy: URLRequest.CachePolicy) -> HttpUpdateState {
        HttpUpdateState { state in
            HttpState(
                base: state.base,
                headers: state.headers,
                cachePolicy: cachePolicy,
                timeoutInMillis: state.timeoutInMillis
            )
        }
    }
    
    public static func custom(function: @escaping (HttpState) -> HttpState) -> HttpUpdateState {
        HttpUpdateState(function)
    }
}
