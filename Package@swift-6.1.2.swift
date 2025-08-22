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
            checksum: "cbf5b05289e3e30f18daef3ba7358886df3b83b64acf267ac5565301dfd27fd6"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable/RealmSwift.xcframework.zip",
            checksum: "9f7079a4a8f32f53b80fef806eaf4fa6ee5e5726df063e5cf782169cb9d66d25"
        )
    ]
)