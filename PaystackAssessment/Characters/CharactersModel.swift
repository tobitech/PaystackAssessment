import APIClient
import Foundation

class CharactersModel: ObservableObject {
	@Published var characters: [CharacterData] = []
	
	init() {
		self.characters = [.rick, .gomez]
	}
}
