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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.4-Swift-6.3.2-Stable-20260512-1618/Realm.xcframework.zip",
            checksum: "848ae10d65645b4bb23c824d9cdb1cb04b9f97ec4740943bf53d68fde5b4edf8"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.4-Swift-6.3.2-Stable-20260512-1618/RealmSwift.xcframework.zip",
            checksum: "70967c4dfffdab9b551d5a0315c75d0088d231e6419b6e963b8fdb421441f0a2"
        )
    ]
)
