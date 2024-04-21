import SwiftUI

struct SearchBar: UIViewRepresentable {
	
	@Binding var text: String
	let placeholder: String
	
	init(text: Binding<String>, placeholder: String) {
		self._text = text
		self.placeholder = placeholder
	}
	
	func makeUIView(context: Context) -> UISearchBar {
		let searchBar = UISearchBar()
		searchBar.backgroundImage = UIImage()
		searchBar.placeholder = placeholder
		searchBar.delegate = context.coordinator
		return searchBar
	}
	
	func updateUIView(_ uiView: UISearchBar, context: Context) {
		uiView.text = text
	}
	
	func makeCoordinator() -> Coordinator {
		return Coordinator(text: $text)
	}
	
	class Coordinator: NSObject, UISearchBarDelegate {
		@Binding var text: String
		
		init(text: Binding<String>) {
			self._text = text
		}
		
		func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
			self.text = searchText
		}
	}
}
