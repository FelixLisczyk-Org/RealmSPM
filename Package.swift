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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.3.3-Stable-20260829-1733/Realm.xcframework.zip",
            checksum: "0b0c693029c49796e2f282ccab541b40556030b131dc821aa9d754f39a32c520"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.5-Swift-6.3.3-Stable-20260829-1733/RealmSwift.xcframework.zip",
            checksum: "d0c674d05b331c5957454bba7865cbde15c95bc596e73a08a6c9cc9415aa516d"
        )
    ]
)
