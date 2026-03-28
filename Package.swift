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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.4-Swift-6.3-Stable-20260328-1106/Realm.xcframework.zip",
            checksum: "b62d86473e3247c5ecfb0309bbcd6d9abacab1783c70792d8bd59aa4cc15d626"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.4-Swift-6.3-Stable-20260328-1106/RealmSwift.xcframework.zip",
            checksum: "d6473da3d986ff5602bae4848c016dcb7dee332546196a79a1693e1733aac5cb"
        )
    ]
)
