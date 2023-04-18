//
//  File.swift
//  
//
//  Created by Andriy Prokhorenko on 01.04.2023.
//

import Foundation
import simprokmachine
import simproktools
import simprokstate



internal extension Machine {
        
    private static func cancelOutline() -> Outline<HttpOutput, HttpInput, HttpInput, HttpOutput> {
        OutlineBuilder()
            .when { trigger in
                switch trigger {
                case .ext(.willCancel(let id)):
                    return [.int(.willCancel(id: id))]
                default:
                    return nil
                }
            }
            .when { trigger in
                switch trigger {
                case .int(.didCancel(let id)):
                    return [.ext(.didCancel(id: id))]
                default:
                    return nil
                }
            }
            .build(.finale())
    }
    
    private static func mainOutline() -> Outline<HttpOutput, HttpInput, HttpInput, HttpOutput> {
        OutlineBuilder()
            .when { trigger in
                switch trigger {
                case .ext(.willLaunch(let id, let request)):
                    return [.int(.willLaunch(id: id, request: request))]
                default:
                    return nil
                }
            }
            .handle { state in
                state.or(Outline.create { trigger in
                    switch trigger {
                    case .int(.didLaunchFail(let id, let reason)):
                        return OutlineTransition(
                            .finale(),
                            effects: .ext(.didLaunchFail(id: id, reason: reason))
                        )
                    default:
                        return nil
                    }
                })
                .switchOnTransition(to: cancelOutline())
            }
            .when { trigger in
                switch trigger {
                case .int(.didLaunchSucceed(let id)):
                    return [.ext(.didLaunchSucceed(id: id))]
                default:
                    return nil
                }
            }
            .when { trigger in
                switch trigger {
                case .int(.didSucceed(let id, let data, let response)):
                    return [.ext(.didSucceed(id: id, data: data, response: response))]
                case .int(.didFail(let id, let error, let response)):
                    return [.ext(.didFail(id: id, error: error, response: response))]
                default:
                    return nil
                }
            }
            .build(.finale())
    }
    
    private static func updateState() -> Outline<HttpOutput, HttpInput, HttpInput, HttpOutput> {
        OutlineBuilder()
            .when { trigger in
                switch trigger {
                case .ext(.willUpdateState(let strategy)):
                    return [.int(.willUpdateState(strategy))]
                default:
                    return nil
                }
            }
            .when { trigger in
                switch trigger {
                case .int(.didUpdateState(let state)):
                    return [.ext(.didUpdateState(state))]
                default:
                    return nil
                }
            }
            .build(.finale())
    }
    
    static func HttpImplementation(state: HttpState) -> Machine<Input, Output>
    where Input == IdData<String, HttpInput>, Output == IdData<String, HttpOutput> {
        .source(
            typeIntTrigger: HttpOutput.self,
            typeIntEffect: HttpInput.self,
            typeExtTrigger: HttpInput.self,
            typeExtEffect: HttpOutput.self,
            typeRequest: ExecutableRequest.self,
            typeResponse: ExecutableResponse.self,
            typeLaunchReason: Void.self,
            typeCancelReason: Void.self,
            outlines: [
                { _ in mainOutline() },
                { _ in updateState() }
            ]
        ) {
            state
        } mapReq: { state, event in
            switch event {
            case .willLaunch(let id, let request):
                let base = request.base ?? state.base
                let path = request.path
                let timeout = request.timeoutInMillis ?? state.timeoutInMillis
                let headers = request.headers ?? state.headers
                let method = request.method
                let body = request.body
                let cachePolicy = request.cachePolicy ?? state.cachePolicy
                let allowsCellularAccess = request.allowsCellularAccess ?? state.allowsCellularAccess
                
                guard timeout >= 0 else {
                    return (state, .ext(.didLaunchFail(id: id, reason: .invalidTimeout)))
                }
                
                guard let url = URL(string: base.scheme + "//" + base.host + "/" + base.pathPrefix + path.string) else {
                    return (state, .ext(.didLaunchFail(id: id, reason: .invalidUrl)))
                }
                
                return (
                    state,
                    .int(
                        .willLaunch(
                            id: id,
                            reason: Void(),
                            isLaunchOnMain: false,
                            request: ExecutableRequest(
                                url: url,
                                timeotInterval: Double(timeout) / 1000,
                                headers: headers.reduce([String: String](), { partial, header in
                                    let key = header.name.string
                                    let value = header.value
                                    
                                    var copy = partial
                                    copy[key] = value
                                    
                                    return copy
                                }),
                                body: body,
                                method: method.string,
                                cachePolicy: cachePolicy,
                                allowsCellularAccess: allowsCellularAccess
                            )
                        )
                    )
                )
                
            case .willCancel(let id):
                return (state, .int(.willCancel(id: id, reason: Void())))
            case .willUpdateState(let strategy):
                let newState = strategy.function(state)
                return (newState, .ext(.didUpdateState(newState)))
            }
        } mapRes: { state, event in
            switch event {
            case .didLaunch(let id, _):
                return (state, .ext(.didLaunchSucceed(id: id)))
            case .didCancel(let id, _):
                 return (state, .ext(.didCancel(id: id)))
            case .didEmit(let id, let response):
                switch response {
                case .success(let data, let value):
                    return (state, .ext(.didSucceed(id: id, data: data, response: value)))
                case .failure(let error, let value):
                    return (state, .ext(.didFail(id: id, error: error, response: value)))
                }
            }
        } holder: {
            RequestHolder()
        } onLaunch: { holder, request, callback in
            holder.task = URLSession.shared.dataTask(with: request.urlRequest) { data, response, error in
                if let error {
                    if let error = error as? URLError {
                        callback((.failure(error: .urlError(error), response: response), true))
                    } else {
                        callback((.failure(error: .otherError(error), response: response), true))
                    }
                } else if let data {
                    callback((.success(data: data, response: response), true))
                } else {
                    callback((.failure(error: .unknown, response: nil), true))
                }
            }
            
            holder.task?.resume()
        } onCancel: { holder in
            holder.task?.cancel()
            holder.task = nil
        }
    }
}
