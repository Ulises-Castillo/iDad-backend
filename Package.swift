// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "iDad-backend",
    products: [
        .library(name: "iDad-backend", targets: ["App"]),
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.6.0"),
        
        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["SwiftProtobuf", "FluentSQLite", "Vapor"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

