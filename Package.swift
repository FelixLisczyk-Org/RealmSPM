// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let realmTarget: Target = .binaryTarget(
        name: "Realm",
        url: "https://github.com/realm/realm-swift/releases/download/v20.0.0/Realm.spm.zip",
        checksum: "11428c01a60a81fb6a314d562de86cf724cd114330c36bcb4415ed276332f176"
    )
    let realmSwiftTarget: Target = .binaryTarget(
        name: "RealmSwift",
        url: "https://github.com/realm/realm-swift/releases/download/v20.0.0/RealmSwift@16_beta_6.spm.zip",
        checksum: "a6e83219ddefd9731aaf39c6a59589cfa998665abdd241398c59c7ae83332253"
    )

    return [realmTarget, realmSwiftTarget]
}

let package = Package(
    name: "RealmSPM",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
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
    targets: buildTargets()
)
