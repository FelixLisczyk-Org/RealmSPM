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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2.4-Stable-20260204-0844/Realm.xcframework.zip",
            checksum: "8988d82f45b332e57dd002fc5c5e92bc3567a745a390af66885e9ffa6aa4f843"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2.4-Stable-20260204-0844/RealmSwift.xcframework.zip",
            checksum: "add0c96257fb9cd6189f0ffa2473489d24be52c6d38d5d2fc2db8dcec3457c5a"
        )
    ]
)
