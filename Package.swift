// swift-tools-version:6.1
// Built with Xcode 27.2 (27B48), swiftlang-6.4.2.1.9

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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.6-Swift-6.4.2-Stable-20261027-0918/Realm.xcframework.zip",
            checksum: "44ca2066cbb37171d882c18e523d8d4d4ae5a69e13faed8a47118f87b65bf284"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.6-Swift-6.4.2-Stable-20261027-0918/RealmSwift.xcframework.zip",
            checksum: "6344b86f2fe9faaba5284fdf30420806a7ea4b48f5093429a6755a55804df9c2"
        )
    ]
)
