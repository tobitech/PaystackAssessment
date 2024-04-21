import SwiftUI

struct CharacterDetailsView: View {
	var character: CharacterData
	
	var body: some View {
		VStack {
			if let imageURL = URL(string: character.image) {
				URLImage(url: imageURL, size: CGSize(width: 100, height: 100))
					.clipShape(Circle())
			}
			VStack {
				Text(character.name)
				Text(character.name)
					.font(.subheadline)
					.foregroundStyle(.secondary)
			}
			.padding(.top)
			
			Divider()
				.padding(.top)
			
			LabeledContent {
				Text(character.species)
			} label: {
				Text("Species")
			}

			LabeledContent {
				Text(character.gender)
			} label: {
				Text("Gender")
			}
			
			LabeledContent {
				Text(character.origin.name)
			} label: {
				Text("Origin")
			}
		}
		.padding()
		.frame(maxHeight: .infinity, alignment: .top)
	}
}

#Preview {
	CharacterDetailsView(character: .gomez)
}
