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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2.1-Stable-20251029-1357/Realm.xcframework.zip",
            checksum: "f0189ca2eede1ad288f1e6b952390b20a2a2c550f8c1d56d09ecf2b83063b68a"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2.1-Stable-20251029-1357/RealmSwift.xcframework.zip",
            checksum: "b4e6ced491cae2cbb5be53548da9c417f36b75105066ce8c85c3eb5c170381aa"
        )
    ]
)
