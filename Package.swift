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
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable/Realm.xcframework.zip",
            checksum: "77afff44820fdae340209cf715a82f9bbf4296bab21ba9792c0ba974459b83cf"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.1.2-Stable/RealmSwift.xcframework.zip",
            checksum: "1c57055edb0aaa076d121d0c229758b533e8768973a99fc11955101cc0c43d62"
        )
    ]
)
