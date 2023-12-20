//
//  Error.swift
//  Appetizers
//
//  Created by user on 2023/12/17.
//

import Foundation

enum APError: Error {
    case invalidData
    case invalidResponse
    case invalidURL
    case unableToComplete
}
