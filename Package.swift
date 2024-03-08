// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let realmTarget: Target = .binaryTarget(
        name: "Realm",
        url: "https://github.com/realm/realm-swift/releases/download/v10.48.0/Realm.spm.zip",
        checksum: "bb63b20a9d0b6651777c16549006a11af6b7556db6e2991ed57eadda62974979"
    )
    let realmSwiftTarget: Target = .binaryTarget(
        name: "RealmSwift",
        url: "https://github.com/realm/realm-swift/releases/download/v10.48.0/RealmSwift@15.3.spm.zip",
        checksum: "36d860d326237b9950d2650f1bc9000b1af0540ce1a9967ae5d7f28be7956456"
    )

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
