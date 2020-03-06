//
//  HTTPTask.swift
//  crm
//
//  Created by Soumya on 29/11/19.
//  Copyright © 2019 SmartServ. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String: String]

enum HTTPTask {
    case request
    
    case requestParameters(parameters: Parameters?,
        bodyEncoding: ParameterEncoding)
    
    case requestParametersAndHeaders(parameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        additionHeaders: HTTPHeaders?)
}
