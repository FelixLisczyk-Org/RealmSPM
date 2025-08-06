// swift-tools-version:6.0

import PackageDescription

func buildTargets() -> [Target] {
    #if swift(>=6.2)
        let realmTarget: Target = .binaryTarget(
            name: "Realm",
            url: "https://www.snipnotes.de/files/realm/v20.0.3/xcode26-0-b5/Realm.xcframework.zip",
            checksum: "71754feabe9588b72cc5f394631a797159d45e311458ae780e0799f4b2b81d95"
        )
        let realmSwiftTarget: Target = .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm/v20.0.3/xcode26-0-b5/RealmSwift.xcframework.zip",
            checksum: "cedfa09a97d5b4504b7c51ce589f56665afaec467ee1993481fc6103050f4dea"
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
