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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Beta-20260824-1950/Realm.xcframework.zip",
            checksum: "34e0fb1a0a3e71b6cabb62560f34f16f9449097eb74eb0033566f1e420653bd3"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Beta-20260824-1950/RealmSwift.xcframework.zip",
            checksum: "65ba2de3a194d4fa8f5b32e4c8dd512a0976c1e093e02fe7ff27ab78b18ef711"
        )
    ]
)
