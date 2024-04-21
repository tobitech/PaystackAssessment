import SwiftUI

struct CharactersView: View {
	@StateObject var model: CharactersModel
	
	var body: some View {
		NavigationStack {
			ScrollView {
				SearchBar(
					text: .init(
						get: { model.query },
						set: { model.queryChanged($0) }
					),
					placeholder: "Search character by name"
				)
				.padding(.horizontal, 8)

				VStack {
					ForEach(model.filteredCharacters) { character in
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
			.scrollDismissesKeyboard(.interactively)
			.navigationTitle("Characters")
			.alert(item: $model.error, content: { error in
				Alert(title: Text("Oops"), message: Text(error.message))
			})
			.task {
				await model.getCharacters()
			}
		}
	}
	
	@ViewBuilder
	func CharacterItemView(character: CharacterData) -> some View {
		HStack {
			if let imageURL = URL(string: character.image) {
				URLImage(url: imageURL, size: CGSize(width: 40, height: 40))
					.clipShape(Circle())
			}
			
			VStack(alignment: .leading) {
				Text(character.name)
				Text(character.status)
					.font(.subheadline)
					.foregroundStyle(.secondary)
			}
		}
		.frame(maxWidth: .infinity, alignment: .leading)
		.padding(.horizontal)
		.background()
	}
}

#Preview {
	CharactersView(model: CharactersModel(apiService: MockAPIService(characters: [.rick, .gomez])))
}
