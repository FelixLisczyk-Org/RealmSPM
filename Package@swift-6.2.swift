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
            checksum: "3a7578c25eaf8725da8da62f7655d0609bfd53c71aca682ee3feaafaeddd32fe"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta/RealmSwift.xcframework.zip",
            checksum: "014d6747de1da35fe52d38a30be6dae9cca70577b8da30fc01d3df9964aca340"
        )
    ]
)
