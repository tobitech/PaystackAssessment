import Foundation

struct CharacterData: Identifiable, Hashable, Decodable {
	let id: Int
	let name: String
	let image: String
	let status: String
	let species: String
	let gender: String
	let origin: OriginData
}

struct OriginData: Hashable, Decodable {
	let name: String
}

#if DEBUG
extension CharacterData {
	static let rick = CharacterData(
		id: 1,
		name: "Rick Sanchez",
		image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
		status: "Alive",
		species: "Human",
		gender: "Male", 
		origin: OriginData(name: "Earth (C-137)")
	)
	static let gomez = CharacterData(
		id: 2,
		name: "Ricky Gomez",
		image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg",
		status: "Alive",
		species: "Human",
		gender: "Female",
		origin: OriginData(name: "Earth (C-500A)")
	)
}
#endif
