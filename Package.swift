// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/realm/realm-swift/releases/download/v10.42.3"
    let xcodeVersion = "15.0"
    
    let realmChecksum = "814d0d58baf6d890fe916db317d58f6be634a0e340ff06f0e4d834e327cbad74"
    let realmSwiftChecksum = "dceee0c30d6111715f5d97313aedcbb5fb072aca50fefecf1341d826b8f06002"
    
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
