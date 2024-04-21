import Foundation

@MainActor
class CharactersModel: ObservableObject {
	var characters: [CharacterData] = []
	
	@Published var filteredCharacters: [CharacterData] = []
	@Published var error: AlertData?
	@Published var query: String = ""
	
	let apiService: APIServiceable
	
	init(apiService: APIServiceable) {
		self.apiService = apiService
	}
	
	func getCharacters() async {
		guard self.characters.isEmpty else {
			return
		}
		let result = await self.apiService.getCharacters()
		switch result {
		case let .success(response):
			self.characters = response.results
			self.filteredCharacters = response.results
		case let .failure(error):
			self.error = AlertData(message: error.errorDescription ?? "Unable to get characters.\nPlease try again!")
		}
	}
	
	func filterCharacters() {
		guard !self.query.isEmpty else {
			self.filteredCharacters = self.characters
			return
		}
		let trimmedQuery = self.query.trimmingCharacters(in: .whitespacesAndNewlines)
		self.filteredCharacters = self.characters.filter { $0.name.lowercased().contains(trimmedQuery.lowercased()) }
	}
}
