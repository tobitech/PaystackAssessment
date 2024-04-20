import SwiftUI

struct URLImage: UIViewRepresentable {
	let url: URL
	
	init(url: URL) {
		self.url = url
	}
	
	func makeUIView(context: Context) -> CacheImageView {
		let imageView = CacheImageView(frame: CGRect(origin: .zero, size: .init(width: 40, height: 40)))
		imageView.contentMode = .scaleAspectFit
		imageView.backgroundColor = .gray.withAlphaComponent(0.3)
		imageView.loadImage(url: url)
		return imageView
	}
	
	func updateUIView(_ uiView: CacheImageView, context: Context) {
		uiView.loadImage(url: url)
	}
}
