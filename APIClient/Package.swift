// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "APIClient",
	platforms: [.iOS(.v17)],
	products: [
		.library(name: "APIClient", targets: ["APIClient"]),
	],
	dependencies: [],
	targets: [
		.target(
			name: "APIClient"
		),
		.testTarget(
			name: "APIClientTests",
			dependencies: ["APIClient"]
		),
	]
)
