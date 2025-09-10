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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Stable-20250910-1610/Realm.xcframework.zip",
            checksum: "05966dbc84f0a8787722145b557049b1cc4ba208a875e5e2747258150c9b2427"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Stable-20250910-1610/RealmSwift.xcframework.zip",
            checksum: "1d1349b8477aeca56d70c9a55d0cd26a480b8e22081ed88a87674dc8a6380eca"
        )
    ]
)
