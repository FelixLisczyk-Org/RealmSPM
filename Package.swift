// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let realmTarget: Target = .binaryTarget(
        name: "Realm",
        url: "https://www.snipnotes.de/files/realm/v20.0.0/Realm.xcframework.zip",
        checksum: "2c2bbd0d579175a5a5cf8dfbdde56ff46fcb9df1364d17d8e06ab51c83a74d0a"
    )
    let realmSwiftTarget: Target = .binaryTarget(
        name: "RealmSwift",
        url: "https://www.snipnotes.de/files/realm/v20.0.0/RealmSwift.xcframework.zip",
        checksum: "02bc73e515b6e53c9b9015e7d05b4758a51c727cfd59e2fee8cf22855709f48f"
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
