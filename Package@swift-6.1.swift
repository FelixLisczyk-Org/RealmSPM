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
            url: "https://www.snipnotes.de/files/realm/v20.0.2/xcode16-4-0/Realm.xcframework.zip",
            checksum: "7f8301015d016690e3b5af80f2d90193a04fadbc6b3e03ade35900a55f52a076"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm/v20.0.2/xcode16-4-0/RealmSwift.xcframework.zip",
            checksum: "bed085bd2c19db65727618bc960fddab493dc6acbcee93f7f208b91a34ddaea5"
        )
    ]
)
