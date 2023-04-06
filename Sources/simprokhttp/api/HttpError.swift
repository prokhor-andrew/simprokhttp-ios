//
//  File.swift
//  
//
//  Created by Andriy Prokhorenko on 03.04.2023.
//

import Foundation

public enum HttpError: Error {
    case urlError(URLError)
    case otherError(Error)
    case unknown
}
