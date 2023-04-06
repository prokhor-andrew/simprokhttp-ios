//
//  File.swift
//  
//
//  Created by Andriy Prokhorenko on 03.04.2023.
//

public struct HttpPath {
    
    public let path: String
    
    /// parameters are not encoded. encode them manually before putting into dictionary
    public let params: [String: String]
    
    public init(
        _ path: String,
        params: [String: String] = [:]
    ) {
        self.path = path
        self.params = params
    }
    
    
    public var string: String {
        String(
            params.reduce("?") { (str, tuple) in
                let (key, value) = tuple
                return str + "\(key)=\(value)&"
            }.dropLast(1)
        )
    }
}
