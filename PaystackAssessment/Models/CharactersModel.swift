import Foundation

@MainActor
class CharactersModel: ObservableObject {
	private(set) var characters: [CharacterData] = []
	private(set) var query: String = ""
	
	@Published private(set) var filteredCharacters: [CharacterData] = []
	@Published var error: AlertData?
	
	private let apiService: APIServiceable
	
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
	
	func queryChanged(_ value: String) {
		self.query = value
		guard !value.isEmpty else {
			self.filteredCharacters = self.characters
			return
		}
		let trimmedQuery = value.trimmingCharacters(in: .whitespacesAndNewlines)
		self.filteredCharacters = self.characters.filter { $0.name.lowercased().contains(trimmedQuery.lowercased()) }
	}
}
