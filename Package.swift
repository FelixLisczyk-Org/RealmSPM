// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let realmTarget: Target = .binaryTarget(
        name: "Realm",
        url: "https://github.com/realm/realm-swift/releases/download/v10.44.0/Realm.spm.zip",
        checksum: "b26c979ce122acaabb6a6eef9567de43344377afa825c597ae6e14caf508c225"
    )

    #if swift(>=5.9.1)
        let realmSwiftTarget: Target = .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/realm/realm-swift/releases/download/v10.44.0/RealmSwift@15.1.spm.zip",
            checksum: "acc10a6a5e0dd285be81b487dc0ff8379f8abaf43bde769f9452843ddb81a383"
        )
    #else
        let realmSwiftTarget: Target = .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/realm/realm-swift/releases/download/v10.44.0/RealmSwift@15.0.spm.zip",
            checksum: "c548dd125df800b5888129f93119360cd3bb3b74ebd740bc21a170f411debee1"
        )
    #endif

    return [realmTarget, realmSwiftTarget]
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
