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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Beta-20260721-1635/Realm.xcframework.zip",
            checksum: "36a39090e4aed27cdfbbd9a935366b5b3b4d357988e5b629821b80fac349678c"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.4-Beta-20260721-1635/RealmSwift.xcframework.zip",
            checksum: "0bd1ff28825cd89e3546dc56ffd2a551ee2180b380d8f8842ad95e18da11525f"
        )
    ]
)
