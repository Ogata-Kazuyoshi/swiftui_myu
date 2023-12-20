
import Foundation

enum CoinAPIError: Error {
    case invalidData
    case jsonParsingFailure
    case requestFialed(description: String)
    case invalidStatusCode(statusCode: Int)
    case unknownError(error: Error)
    
    var customDescription: String {
        switch self {
        case .invalidData: return "Invalid data"
        case .jsonParsingFailure: return "Failed to parse JSON"
        case let .requestFialed(description): return "Request failed: \(description)"
        case let .invalidStatusCode(statusCode): return "Invalid Statud Code: \(statusCode)"
        case let .unknownError(error): return "Unknown Error: \(error.localizedDescription)"
        }
    }
}
