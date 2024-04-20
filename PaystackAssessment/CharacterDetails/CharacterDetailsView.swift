import SwiftUI

struct CharacterDetailsView: View {
	var character: CharacterData
	
	var body: some View {
		VStack {
			if let imageURL = URL(string: character.image) {
				AsyncImage(url: imageURL) { image in
					image
						.resizable()
						.frame(width: 100, height: 100)
						.clipShape(Circle())
				} placeholder: {
					Image(systemName: "person.circle.fill")
						.resizable()
						.frame(width: 100, height: 100)
						.foregroundStyle(.tertiary)
						.clipShape(Circle())
				}
			}
			Text(character.name)
				.padding(.top)
		}
		.padding()
		.frame(maxHeight: .infinity, alignment: .top)
	}
}

#Preview {
	CharacterDetailsView(character: .gomez)
}
