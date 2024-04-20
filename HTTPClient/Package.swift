// swift-tools-version: 5.7.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "HTTPClient",
	platforms: [.iOS(.v16)],
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
