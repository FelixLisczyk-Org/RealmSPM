// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    [
        .binaryTarget(
            name: "Realm",
            url: "https://www.snipnotes.de/files/realm-swift/10.44.0/Realm.xcframework.zip",
            checksum: "e0aa253174bb6d5f61333b36256654eaac16a358738ced143681e5778a387317"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm-swift/10.44.0/RealmSwift.xcframework.zip",
            checksum: "9728f22232398a18f33a6dd48ab99d1b02815ca55476fb9e34024e24fb017653"
        )
    ]
}

let package = Package(
    name: "RealmSPM",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4)
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
    targets: buildTargets()
)
