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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.4-Swift-6.3.1-Stable-20260417-0847/Realm.xcframework.zip",
            checksum: "528edcae9940bf43d428ba88b0469138a56c2610bc8eda49feeb1bb104448de3"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.4-Swift-6.3.1-Stable-20260417-0847/RealmSwift.xcframework.zip",
            checksum: "15e79d886ffb2a2b7a89b3aff4251ebbe911ebd86525392ab091ae9a142430a1"
        )
    ]
)
