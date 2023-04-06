//
//  File.swift
//  
//
//  Created by Andriy Prokhorenko on 03.04.2023.
//

import Foundation

public enum HttpOutput {
    case didLaunchSucceed(id: String)
    case didLaunchFail(id: String, reason: HttpNotSentReason)
    
    case didCancel(id: String)
    
    case didSucceed(id: String, data: Data, response: URLResponse?)
    case didFail(id: String, error: HttpError, response: URLResponse?)
    
    case didUpdateState(HttpState)
}

