// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    [
        .binaryTarget(
            name: "Realm",
            url: "https://www.snipnotes.de/files/realm-swift/10.43.0/Realm.xcframework.zip",
            checksum: "004f240f7ffbc6ffe08eaa91507243e2b49bba1eaab1008585bd778c02b38c27"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm-swift/10.43.0/RealmSwift.xcframework.zip",
            checksum: "fdf2dacebc354628e923d206157d0d3e616857b5c6dd709db890c761624571fb"
        ),
    ]
}

let package = Package(
    name: "RealmSPM",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4),
    ],
    products: [
        .library(
            name: "Realm",
            targets: ["Realm"]
        ),
        .library(
            name: "RealmSwift",
            targets: ["Realm", "RealmSwift"]
        ),
    ],
    targets: buildTargets()
)
