//
//  File.swift
//  
//
//  Created by Andriy Prokhorenko on 03.04.2023.
//

import simprokmachine
import simproktools

public extension Machine where Input == IdData<String, HttpInput>, Output == IdData<String, HttpOutput> {
    
    static func http(state: HttpState) -> Machine<Input, Output> {
        HttpImplementation(state: state)
    }
}
