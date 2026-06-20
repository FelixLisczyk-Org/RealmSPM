// swift-tools-version:6.1

import PackageDescription

let package = Package(
    name: "RealmSPM",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .watchOS(.v8)
    ],
    products: [
        .library(
            name: "Realm",
            targets: ["Realm"]
        ),
        .library(
            name: "RealmSwift",
            targets: ["Realm", "RealmSwift"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "Realm",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.3.3-Stable-20260620-0756/Realm.xcframework.zip",
            checksum: "b06ed143ad109f958fb87698dfe6a4b8908f88465693e6e8a3ecf170d6a6f815"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.3.3-Stable-20260620-0756/RealmSwift.xcframework.zip",
            checksum: "db532f0b03536b08f0aaabf598ebf011d8fe87bc8a6035964d48ba6bd3bb8afd"
        )
    ]
)
