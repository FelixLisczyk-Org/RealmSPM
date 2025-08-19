// swift-tools-version:6.0

import PackageDescription

func buildTargets() -> [Target] {
    #if swift(>=6.2)
        let realmTarget: Target = .binaryTarget(
            name: "Realm",
            url: "https://www.snipnotes.de/files/realm/v20.0.3/xcode26-0-b7/Realm.xcframework.zip",
            checksum: "cb11bb89974cb8feaeb8d6f9854cb39ca659f778c7319d673262b5f065a8d059"
        )
        let realmSwiftTarget: Target = .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm/v20.0.3/xcode26-0-b7/RealmSwift.xcframework.zip",
            checksum: "02425351cab726295b69fc0f4d3dd1d7510207feeefc604c4ca6d6187982327d"
        )
    #else
        let realmTarget: Target = .binaryTarget(
            name: "Realm",
            url: "https://www.snipnotes.de/files/realm/v20.0.2/xcode16-4-0/Realm.xcframework.zip",
            checksum: "7f8301015d016690e3b5af80f2d90193a04fadbc6b3e03ade35900a55f52a076"
        )
        let realmSwiftTarget: Target = .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm/v20.0.2/xcode16-4-0/RealmSwift.xcframework.zip",
            checksum: "bed085bd2c19db65727618bc960fddab493dc6acbcee93f7f208b91a34ddaea5"
        )
    #endif
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
