// swift-tools-version:6.2

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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta/Realm.xcframework.zip",
            checksum: "622e731c2e57a3e6226b37ecf821be0d7ffa3abbeaf5b80fc29ae527a8b37239"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta/RealmSwift.xcframework.zip",
            checksum: "badd559d24e2fd859d67f9fc10a6f28ba937e47cd3757ca4258e35aba6d4eb47"
        )
    ]
)