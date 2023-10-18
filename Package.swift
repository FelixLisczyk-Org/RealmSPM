// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    [
        .binaryTarget(
            name: "Realm",
            url: "https://www.snipnotes.de/files/realm-swift/10.43.1/Realm.xcframework.zip",
            checksum: "b74ad43bde341a3f56c214d701894ebfd95b82a8903750c1056714b2a6fd709d"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm-swift/10.43.1/RealmSwift.xcframework.zip",
            checksum: "08f8fd17c4074b5e91247b0df894a4458c2937b272f11d49bfbdfeb5eb403399"
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
