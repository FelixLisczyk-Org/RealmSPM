// swift-tools-version:6.1.2

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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable/Realm.xcframework.zip",
            checksum: "29d02b02b4a386a3e866e72ced4a1caaf31fdf2db8a0f645d0c2b9aa561cc4b6"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable/RealmSwift.xcframework.zip",
            checksum: "f2a322d81b56f2c8ea5b603d30985f53c468b574f96154764b2875c944d13798"
        )
    ]
)