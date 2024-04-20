// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "HTTPClient",
	platforms: [.iOS(.v17)],
	products: [
		.library(name: "HTTPClient", targets: ["HTTPClient"]),
	],
	dependencies: [],
	targets: [
		.target(
			name: "HTTPClient"
		),
		.testTarget(
			name: "HTTPClientTests",
			dependencies: ["HTTPClient"]
		),
	]
)
