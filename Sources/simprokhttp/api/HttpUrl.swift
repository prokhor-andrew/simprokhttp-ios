//
//  HttpUrl.swift
//  
//
//  Created by Andriy Prokhorenko on 19.10.2022.
//



public struct HttpUrl {
    
    /// Do not include dashes at the end or beginning. Example: "https"
    public let scheme: String
    /// Do not include dashes at the end or beginning. Example: "simprok.com"
    public let host: String
    /// Do not include dashes at the end or beginning. Example: "dev/api/v1"
    public let pathPrefix: String
    
    public init(
        scheme: String,
        host: String,
        pathPrefix: String
    ) {
        self.scheme = scheme
        self.host = host
        self.pathPrefix = pathPrefix
    }
}
