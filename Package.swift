// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/realm/realm-swift/releases/download/v10.42.2"
    let xcodeVersion = "15.0"
    
    let realmChecksum = "b3eee3236de1991cfe6ab3072052c33e4030c01154216bfab94224b2ca92b848"
    let realmSwiftChecksum = "228b7d129e946cb1a839bd31ac07d4b3713dd89bca01b92b6abccb4756b16a80"
    
    return [
        .binaryTarget(
            name: "Realm",
            url: "\(baseURL)/Realm.spm.zip",
            checksum: realmChecksum
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "\(baseURL)/RealmSwift@\(xcodeVersion).spm.zip",
            checksum: realmSwiftChecksum
        ),
    ]
}

let package = Package(
    name: "RealmSPM",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v11),
        .tvOS(.v11),
        .watchOS(.v4),
    ],
    products: [
        .library(
            name: "Realm",
            targets: ["Realm"]
        ),
        .library(
            name: "RealmSwift",
            targets: ["Realm", "RealmSwift"]
        ),
    ],
    targets: buildTargets()
)
