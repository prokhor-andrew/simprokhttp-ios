//
//  HttpHeader.swift
//  
//
//  Created by Andriy Prokhorenko on 18.10.2022.
//

import Foundation


public struct HttpHeader: Hashable {
    
    public struct Name: Hashable {
        
        public let string: String
        
        public init(_ string: String) {
            self.string = string
        }
        
        public static let accept: Name = Name("Accept")
        public static let acceptCharset: Name = Name("Accept-Charset")
        public static let acceptLanguage: Name = Name("Accept-Language")
        public static let acceptEncoding: Name = Name("Accept-Encoding")
        public static let contentType: Name = Name("Content-Type")
        public static let contentDisposition: Name = Name("Content-Disposition")
        public static let userAgent: Name = Name("User-Agent")
        public static let authorization: Name = Name("Authorization")
        
        
        public static func ==(lhs: Name, rhs: Name) -> Bool {
            lhs.string.lowercased() == rhs.string.lowercased()
        }
    }
        
    public let name: Name
    public let value: String
    
    public init(name: Name, value: String) {
        self.name = name
        self.value = value
    }
    
    public static func accept(_ value: String) -> HttpHeader {
        HttpHeader(name: .accept, value: value)
    }
    
    public static func acceptCharset(_ value: String) -> HttpHeader {
        HttpHeader(name: .acceptCharset, value: value)
    }
    
    public static func acceptLanguage(_ value: String) -> HttpHeader {
        HttpHeader(name: .acceptLanguage, value: value)
    }
    
    public static func acceptEncoding(_ value: String) -> HttpHeader {
        HttpHeader(name: .acceptEncoding, value: value)
    }
    
    public static func contentType(_ value: String) -> HttpHeader {
        HttpHeader(name: .contentType, value: value)
    }
    
    public static func contentDisposition(_ value: String) -> HttpHeader {
        HttpHeader(name: .contentDisposition, value: value)
    }
    
    public static func userAgent(_ value: String) -> HttpHeader {
        HttpHeader(name: .userAgent, value: value)
    }
    
    public struct Authorization {
        
        public let string: String
        
        public init(_ string: String) {
            self.string = string
        }
        
        public static func basic(username: String, password: String) -> Authorization {
            let credential = Data("\(username):\(password)".utf8).base64EncodedString()
            return Authorization("Basic \(credential)")
        }
        
        public static func bearer(token: String) -> Authorization {
            Authorization("Bearer \(token)")
        }
    }
    
    public static func authorization(_ value: Authorization) -> HttpHeader {
        HttpHeader(name: .authorization, value: value.string)
    }
    
    public static func ==(lhs: HttpHeader, rhs: HttpHeader) -> Bool {
         lhs.name == rhs.name
    }
}
