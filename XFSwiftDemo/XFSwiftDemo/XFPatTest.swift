//
//  XFPatTest.swift
//  XFSwiftDemo
//
//  Created by Aron.Li on 2024/3/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}


protocol Request {
    associatedtype Output
    var url: URL {get}
    var method: HTTPMethod {get}
    func decode(_ data: Data) throws -> Output
}

class RequestCache<Value> {
    // 报错：
    // 1.Protocol 'Request' can only be used as a generic constraint because it has Self or associated type requirements
    // 2.Type 'Request' does not conform to protocol 'Hashable'
//    private var store: [Request: Value] = [:]
    
    private var store: [AnyRequest: Value] = [:]
    
    // 将Request的具体类转化为AnyRequest包装类
    /// 从store取
    func response<R: Request>(for request: R) -> Value? where R.Output == Value {
        let erasedRequest = AnyRequest(url: request.url, method: request.method)
        return store[erasedRequest]
    }
    
    /// 存store中
    func saveStore<R: Request>(response: Value, for request: R) where R.Output == Value {
        let erasedRequest = AnyRequest(url: request.url, method: request.method)
        store[erasedRequest] = response
    }
    
}

struct AnyRequest: Hashable {
    let url: URL
    let method: HTTPMethod
}



