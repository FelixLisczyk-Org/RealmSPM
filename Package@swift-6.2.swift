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
            checksum: "b72358dca4c3d01ba2e68a9392f6cabea5ec4a99d861711766bb119680d3733d"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta/RealmSwift.xcframework.zip",
            checksum: "e9b128c6a4a4ff65f84ac7f93ecb20ab2621632622787f20e6a0893aed1016a1"
        )
    ]
)
