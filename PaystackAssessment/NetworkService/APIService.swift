import HTTPClient
import Foundation

protocol APIServiceable {
	func getCharacters() async -> Result<CharactersAPIResponse, RequestError>
}

struct LiveAPIService: APIServiceable, HTTPClient {
	let urlSession: URLSession
	
	init(urlSession: URLSession = .shared) {
		self.urlSession = urlSession
	}
	
	func getCharacters() async -> Result<CharactersAPIResponse, RequestError> {
		await request(APIEndpoint.characters, responseType: CharactersAPIResponse.self)
	}
}

#if DEBUG
struct MockAPIService: APIServiceable {
	func getCharacters() async -> Result<CharactersAPIResponse, RequestError> {
		return .success(CharactersAPIResponse(results: [.rick, .gomez]))
	}
}
#endif
