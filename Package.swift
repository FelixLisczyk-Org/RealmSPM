// swift-tools-version:5.8

import PackageDescription

func buildTargets() -> [Target] {
    #if swift(>=5.9.1)
        // Xcode 15.1
        let realmTarget: Target = .binaryTarget(
            name: "Realm",
            url: "https://www.snipnotes.de/files/realm/10.44.0/15.1/Realm.xcframework.zip",
            checksum: "050f338bf16637858d661900170a5e9de0d308885103d7cefeee902a9128fb08"
        )
        let realmSwiftTarget: Target = .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm/10.44.0/15.1/RealmSwift.xcframework.zip",
            checksum: "940659d407d4933277c1efb8286710eceedf8f4de1e614223e6e1a3fdb6d0a40"
        )
    #else
        // Xcode 15.0
        let realmTarget: Target = .binaryTarget(
            name: "Realm",
            url: "https://www.snipnotes.de/files/realm/10.44.0/15.0/Realm.xcframework.zip",
            checksum: "1e795e41a607de77f6032cc5dc93cf867ec43a1cc63b8458b2f4be8c9304fc4a"
        )
        let realmSwiftTarget: Target = .binaryTarget(
            name: "RealmSwift",
            url: "https://www.snipnotes.de/files/realm/10.44.0/15.0/RealmSwift.xcframework.zip",
            checksum: "5a08edb76ac336d976ca8ac56e673d475a8db4e0bc9ca98ce252278b9db908e0"
        )
    #endif

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
