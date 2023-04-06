//
//  File 2.swift
//  
//
//  Created by Andriy Prokhorenko on 03.04.2023.
//

import Foundation

enum ExecutableResponse {
    case success(data: Data, response: URLResponse?)
    case failure(error: HttpError, response: URLResponse?)
}
