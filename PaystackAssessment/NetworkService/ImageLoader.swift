import UIKit

enum ImageLoaderError: Error {
	case badRequest
	case unsupportedImage
}

@MainActor
class ImageLoader: ObservableObject {
	@Published var uiImage: UIImage?
	private static let cache = NSCache<NSString, UIImage>()
	
	func fetchImage(_ url: URL) async throws {
		
		let request = URLRequest(url: url)
		
		// check in cache
		if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString) {
			uiImage = cachedImage
		} else {
			let (data, response) = try await URLSession.shared.data(for: request)
			guard let httpResponse = response as? HTTPURLResponse,
						httpResponse.statusCode == 200 else {
				throw ImageLoaderError.badRequest
			}
			
			guard let image = UIImage(data: data) else {
				throw ImageLoaderError.unsupportedImage
			}
			
			// store it in the cache
			Self.cache.setObject(image, forKey: url.absoluteString as NSString )
			
			uiImage = image
		}
	}
}
