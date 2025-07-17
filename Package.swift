// swift-tools-version:6.0

import PackageDescription

func buildTargets() -> [Target] {
    #if swift(>=6.2)
        let realmTarget: Target = .binaryTarget(
            name: "Realm",
            url: "https://www.snipnotes.de/files/realm/v20.0.3/xcode26-0/Realm.xcframework.zip",
            checksum: "80bcdd7ba1b6c6c356962cdaf68a0f397880146014f760c1ff7f05862e90b7ec"
        )
        let realmSwiftTarget: Target = .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm/v20.0.3/xcode26-0/RealmSwift.xcframework.zip",
            checksum: "5f3a5aa8c2546e2b1774c2a615d03fb608a76800cffde6432d9c1cd7d5620f84"
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
