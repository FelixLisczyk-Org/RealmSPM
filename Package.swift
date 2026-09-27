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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.6-Swift-6.4-Stable-20260927-1040/Realm.xcframework.zip",
            checksum: "81ec53a71d8eeef326c1d15d10ea2602b024861e2dcbe5be6a4d38d944eed097"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.6-Swift-6.4-Stable-20260927-1040/RealmSwift.xcframework.zip",
            checksum: "2f44985f2432b843f1d1d73b865195fd5610d814bf8cd00f0c5a1d982ce54fcd"
        )
    ]
)
