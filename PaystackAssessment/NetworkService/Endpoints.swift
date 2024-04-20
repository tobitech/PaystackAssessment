import HTTPClient
import Foundation

enum APIEndpoint {
	case characters
}

extension APIEndpoint: Endpoint {
	var host: String {
		return "rickandmortyapi.com"
	}
	
	var method: HTTPMethod {
		switch self {
		case .characters:
			return .get
		}
	}
	
	var header: [String : String]? {
		switch self {
		case .characters:
			return nil
		}
	}
	
	var body: [String : Any]? {
		switch self {
		case .characters:
			return nil
		}
	}
	
	var path: String {
		switch self {
		case .characters:
			return "/api/character"
		}
	}
}
