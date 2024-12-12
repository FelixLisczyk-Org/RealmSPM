// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let realmTarget: Target = .binaryTarget(
        name: "Realm",
        url: "https://www.snipnotes.de/files/realm/v20.0.0/xcode16-2/Realm.xcframework.zip",
        checksum: "4954da47e0bd7ca235b7fe385a6e891bd7ec6b55526368399542f4a246842ecc"
    )
    let realmSwiftTarget: Target = .binaryTarget(
        name: "RealmSwift",
        url: "https://www.snipnotes.de/files/realm/v20.0.0/xcode16-2/RealmSwift.xcframework.zip",
        checksum: "47aa8320ab1bb5854f4079d037ee10990217fd01533a44024e10826599e35d4e"
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
