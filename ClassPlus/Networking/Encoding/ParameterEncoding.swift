//
//  ParameterEncoding.swift
//  crm
//
//  Created by Soumya on 29/11/19.
//  Copyright © 2019 SmartServ. All rights reserved.
//

import Foundation

 typealias Parameters = [String:Any]

 protocol ParameterEncoder {
    func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws
    func setContentType(urlRequest: inout URLRequest)
}

 enum ParameterEncoding {
    
    case urlEncoding
    case jsonEncoding
//    case urlAndJsonEncoding

     func encode(urlRequest: inout URLRequest, parameters: Parameters?, requestType: HTTPMethod) throws {
        do {
            switch self {
            case .urlEncoding:
                URLParameterEncoder().setContentType(urlRequest: &urlRequest)
                
            case .jsonEncoding:
                JSONParameterEncoder().setContentType(urlRequest: &urlRequest)
//            case .urlAndJsonEncoding:
//                guard let bodyParameters = bodyParameters,
//                    let urlParameters = urlParameters else { return }
//                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
//                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
            }

            switch requestType {
            case .get:
                guard let urlParameters = parameters else { return }
                try URLParameterEncoder().encode(urlRequest: &urlRequest, with: urlParameters)
            default:
                guard let bodyParameters = parameters else { break }
                try JSONParameterEncoder().encode(urlRequest: &urlRequest, with: bodyParameters)
            }
        } catch {
            throw error
        }
    }
}


 enum NetworkError: String, Error {
    case parametersNil = "Parameters were nil."
    case encodingFailed = "Parameter encoding failed."
    case missingURL = "URL is nil."
}
