import PackageDescription

let package = Package(
    name: "ZeroMQ",
    dependencies: [
        .Package(url: "https://github.com/Zewo/Reflection.git", majorVersion: 0, minor: 14),
        .Package(url: "https://github.com/Zewo/CZeroMQ.git", majorVersion: 1, minor: 0),
    ]
)
