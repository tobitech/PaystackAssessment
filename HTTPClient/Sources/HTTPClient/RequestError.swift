import Foundation

public enum RequestError: Error {
	case decode
	case invalidURL
	case invalidData
	case noResponse
	case unauthorized
	case unexpectedStatusCode
	case unknown
}

extension RequestError: LocalizedError {
	public var errorDescription: String? {
		switch self {
		case .decode:
			return "Decoding Error"
		case .invalidURL:
			return "Invalid URL"
		case .invalidData:
			return "Server returned unexpected data"
		case .noResponse:
			return "Server didn't return a response"
		case .unauthorized:
			return "Unauthorized"
		case .unexpectedStatusCode:
			return "Unexpected status code"
		case .unknown:
			return "Unknown error"
		}
	}
}
