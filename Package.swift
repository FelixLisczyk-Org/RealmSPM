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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.4-Swift-6.3.3-Stable-20260613-1145/Realm.xcframework.zip",
            checksum: "fe425ff8851a540747d53fb30073f6e2d504b0417ae7e2399ca338920ed95a9c"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.4-Swift-6.3.3-Stable-20260613-1145/RealmSwift.xcframework.zip",
            checksum: "6713cd5754425a44db82e87dabb93e15b088fd0b783b52835eb5b5b63e3f33b1"
        )
    ]
)
