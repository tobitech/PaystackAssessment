import Foundation

struct CharacterData: Identifiable, Hashable, Decodable {
	let id: Int
	let name: String
	let image: String
}

#if DEBUG
extension CharacterData {
	static let rick = CharacterData(
		id: 1,
		name: "Rick Sanchez",
		image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
	)
	static let gomez = CharacterData(
		id: 2,
		name: "Ricky Gomez",
		image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg"
	)
}
#endif
