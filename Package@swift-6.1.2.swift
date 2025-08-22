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
            c32824c799c68059af7d6a85dd711269930c7851088a0189b1f49d65e5"
        ),
        .binaryTarget(
            name: "RealmSwift",
            c2d96b504cca1fd36a063e0939b104d08528cb0afce39c3059cbc4141e058"
        )
    ]
)