//
//  File.swift
//  
//
//  Created by Andriy Prokhorenko on 03.04.2023.
//

import simprokstate

public enum HttpInput {
    case willLaunch(id: String, request: HttpRequest)
    case willCancel(id: String)
    case willUpdateState(HttpUpdateState)
}
