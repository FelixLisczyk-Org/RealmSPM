// swift-tools-version:6.2

import PackageDescription

let package = Package(
    name: "RealmSPM",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
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
    targets: [
        .binaryTarget(
            name: "Realm",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta-20250829-0711/Realm.xcframework.zip",
            checksum: "13d020f32f370e2ad37c1ff9558170371b560f13b0db087f06fc71078dc0e3e3"
        ),
        .binaryTarget(
            name: "RealmSwift",
            url: "https://github.com/FelixLisczyk-Org/RealmSPM/releases/download/Realm-20.0.3-Swift-6.2-Beta-20250829-0711/RealmSwift.xcframework.zip",
            checksum: "41f9912525f17647588099ddd4a1ecf8428d72d3b46d24908baa35f6a5c792f1"
        )
    ]
)
