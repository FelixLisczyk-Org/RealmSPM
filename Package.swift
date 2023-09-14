// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    let baseURL = "https://github.com/realm/realm-swift/releases/download/v10.42.1"
    let xcodeVersion = "15.0"
    
    let realmChecksum = "5a166d03debda99f4378959a3cf39fc31c1e250a7aa7e9ec90b43450b99f5801"
    let realmSwiftChecksum = "65edd34a49cc766a715c5244e80262e82c7e2a0660fd275a9df98def29c12343"
    
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
