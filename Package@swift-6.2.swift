// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "RealmSPM",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
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
            url: "https://www.snipnotes.de/files/realm/v20.0.3/xcode26-0-b7/Realm.xcframework.zip",
            checksum: "cb11bb89974cb8feaeb8d6f9854cb39ca659f778c7319d673262b5f065a8d059"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm/v20.0.3/xcode26-0-b7/RealmSwift.xcframework.zip",
            checksum: "02425351cab726295b69fc0f4d3dd1d7510207feeefc604c4ca6d6187982327d"
        )
    ]
)
