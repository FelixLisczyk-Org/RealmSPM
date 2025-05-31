// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let realmTarget: Target = .binaryTarget(
        name: "Realm",
        url: "https://www.snipnotes.de/files/realm/v20.0.2/xcode16-4/Realm.xcframework.zip",
        checksum: "2fd18fbdccc6a55541f8c2f973128acd30e386e423fa5f84241477c24b6bd489"
    )
    let realmSwiftTarget: Target = .binaryTarget(
        name: "RealmSwift",
        url: "https://www.snipnotes.de/files/realm/v20.0.2/xcode16-4/RealmSwift.xcframework.zip",
        checksum: "aae85bf8ec6b68ae43516b53b6bb5877e459ac8cecb82cf77605b85d1e7a9eec"
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
