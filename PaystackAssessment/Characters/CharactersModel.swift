import Foundation

@MainActor
class CharactersModel: ObservableObject {
	@Published var characters: [CharacterData] = []
	@Published var error: String?
	
	let apiService: APIServiceable
	
	init(apiService: APIServiceable) {
		self.apiService = apiService
	}
	
	func getCharacters() async {
		let result = await self.apiService.getCharacters()
		switch result {
		case let .success(response):
			self.characters = response.results
		case let .failure(error):
			self.error = error.errorDescription
		}
	}
}
