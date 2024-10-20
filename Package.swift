// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let realmTarget: Target = .binaryTarget(
        name: "Realm",
        url: "https://www.snipnotes.de/files/realm/v20.0.0/Realm.xcframework.zip",
        checksum: "8b7ffc1f7d7be7d6ad3506de278b869bbf6b6752b7ff7f15fe0da437287765db"
    )
    let realmSwiftTarget: Target = .binaryTarget(
        name: "RealmSwift",
        url: "https://www.snipnotes.de/files/realm/v20.0.0/RealmSwift.xcframework.zip",
        checksum: "3b1a25253d95102b619184b2d1302dfc514c883f98e94295e36d605c528fc299"
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
