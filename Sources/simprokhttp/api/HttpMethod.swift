//
//  File 2.swift
//  
//
//  Created by Andriy Prokhorenko on 03.04.2023.
//

public struct HttpMethod: Equatable {
    
    public static let get: HttpMethod = HttpMethod("GET")
    public static let post: HttpMethod = HttpMethod("POST")
    public static let put: HttpMethod = HttpMethod("PUT")
    public static let delete: HttpMethod = HttpMethod("DELETE")
    public static let patch: HttpMethod = HttpMethod("PATCH")
    public static let head: HttpMethod = HttpMethod("HEAD")
    public static let options: HttpMethod = HttpMethod("OPTIONS")
    public static let connect: HttpMethod = HttpMethod("CONNECT")
    public static let trace: HttpMethod = HttpMethod("TRACE")
    public static let query: HttpMethod = HttpMethod("QUERY")
    
    public let string: String
    
    public init(_ string: String) {
        self.string = string
    }
    

    public static func ==(lhs: HttpMethod, rhs: HttpMethod) -> Bool {
        lhs.string.lowercased() == rhs.string.lowercased()
    }
}
