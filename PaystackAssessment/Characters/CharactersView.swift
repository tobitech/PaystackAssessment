import SwiftUI

struct CharactersView: View {
	@StateObject var model: CharactersModel
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack {
					ForEach(model.characters) { character in
						NavigationLink(value: character) {
							CharacterItemView(character: character)
						}
						.buttonStyle(.plain)
					}
				}
				.navigationDestination(for: CharacterData.self) { character in
					CharacterDetailsView(character: character)
				}
			}
			.scrollIndicators(.hidden)
			.navigationTitle("Characters")
			.task {
				await model.getCharacters()
			}
		}
	}
	
	@ViewBuilder
	func CharacterItemView(character: CharacterData) -> some View {
		HStack {
			if let imageURL = URL(string: character.image) {
				URLImage(url: imageURL)
					.frame(width: 40, height: 40)
					.clipShape(Circle())
			}
			
			Text(character.name)
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding(.horizontal)
		.background()
	}
}

#Preview {
	CharactersView(model: CharactersModel(apiService: MockAPIService()))
}
