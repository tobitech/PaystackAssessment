import SwiftUI

enum ImageLoaderError: Error {
	case baseRequest
	case badURL
	case unsupportedImage
}

class CacheImageView: UIImageView {
	private static let cache = NSCache<NSString, UIImage>()
	
	func loadImage(url: URL) {
		let request = URLRequest(url: url)
		
		// Check in the cache
		if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString) {
			self.image = cachedImage
		} else {
			URLSession.shared.dataTask(with: request) { (data, response, error) in
				guard error == nil else { return }
				guard let httpResponse = response as? HTTPURLResponse,
							httpResponse.statusCode == 200 else {
					return
				}
				guard let data = data, 
								let image = UIImage(data: data) else {
					return
				}
				// Store download image in cache.
				Self.cache.setObject(image, forKey: url.absoluteString as NSString)
				DispatchQueue.main.async {
					self.image = image
				}
			}.resume()
		}
	}
}
