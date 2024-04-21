import SwiftUI

struct URLImage: View {
	let url: URL
	let size: CGSize
	
	@StateObject private var imageLoader = ImageLoader()
	
	init(url: URL, size: CGSize) {
		self.url = url
		self.size = size
	}
	
	var body: some View {
		VStack {
			if let uiImage = imageLoader.uiImage {
				Image(uiImage: uiImage)
					.resizable()
					.aspectRatio(contentMode: .fit)
					.frame(width: size.width, height: size.height)
			} else {
				Color.gray.opacity(0.3)
					.frame(width: size.width, height: size.height)
			}
		}
		.task {
			await downloadImage()
		}
	}
	
	private func downloadImage() async {
		do {
			try await imageLoader.fetchImage(url)
		} catch {
			print(error.localizedDescription)
		}
	}
}
