// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let realmTarget: Target = .binaryTarget(
        name: "Realm",
        url: "https://www.snipnotes.de/files/realm/v20.0.0/xcode16-2/Realm.xcframework.zip",
        checksum: "2d759953b5917367d67e2ee038e76d7bdfd72949d937df22882e8391450faf42"
    )
    let realmSwiftTarget: Target = .binaryTarget(
        name: "RealmSwift",
        url: "https://www.snipnotes.de/files/realm/v20.0.0/xcode16-2/RealmSwift.xcframework.zip",
        checksum: "bf5123a5854d2ad5b53d5c812411fad30cab570e6231016805bc845fbc0cb62f"
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
