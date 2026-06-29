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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Beta-20260629-0932/Realm.xcframework.zip",
            checksum: "dc5f2c5d944a146b20d9b17ffa830ed1b1f2d9679865ee71f868b6969a61ecfc"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Beta-20260629-0932/RealmSwift.xcframework.zip",
            checksum: "581ec61f5ab49f62160fdf3ddf25983c42ca819c0b758a7039321b87fbba6953"
        )
    ]
)