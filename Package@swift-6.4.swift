// swift-tools-version:6.4

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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Beta-20260811-0716/Realm.xcframework.zip",
            checksum: "e161e087e4696d47f5383eb49cca7bc326ef1118481abbfe009599e43c82dbea"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Beta-20260811-0716/RealmSwift.xcframework.zip",
            checksum: "ae78a4433d59d8d2935fec3bf9973d3f444b1414fb51fa205e1e54ea09fc8985"
        )
    ]
)
