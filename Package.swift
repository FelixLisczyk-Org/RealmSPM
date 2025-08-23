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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable-20250823-0616/Realm.xcframework.zip",
            checksum: "c7cb358f2461df1490f242c0d095d20bcdccd8ba6c7349a0e062065752d62f14"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable-20250823-0616/RealmSwift.xcframework.zip",
            checksum: "0010e6d857f8bde9a7263cb8128d51ff504c7742e793702760b44576c308fde5"
        )
    ]
)
