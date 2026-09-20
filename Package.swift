// swift-tools-version:5.9
//
// Copyright 2026 Google LLC.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import PackageDescription

let package = Package(
  name: "eDistantObject",
  platforms: [.iOS(.v12), .macOS(.v10_15)],
  products: [
    .library(name: "eDistantObject", targets: ["eDistantObject"]),
    .library(name: "EDOSwift", targets: ["EDOSwift"]),
  ],
  targets: [
    .target(
      name: "eDistantObject",
      path: ".",
      // The target spans the repository root, so everything outside the four source
      // directories is named here or Xcode sweeps it up as a resource.
      exclude: [
        "CHANGELOG.md",
        "CONTRIBUTING.md",
        "Channel/Tests",
        "Device/Tests",
        "DeviceForwarder",
        "LICENSE",
        "Measure/Tests",
        "Podfile",
        "README.md",
        "Service/SwiftSources",
        "Service/Tests",
        "docs",
        "eDistantObject.podspec",
        "eDistantObject.xcodeproj",
      ],
      sources: [
        "Channel/Sources",
        "Device/Sources",
        "Measure/Sources",
        "Service/Sources",
      ],
      publicHeadersPath: "include",
      cSettings: [.headerSearchPath(".")]
    ),
    .target(
      name: "EDOSwift",
      dependencies: ["eDistantObject"],
      path: "Service/SwiftSources"
    ),
  ]
)
