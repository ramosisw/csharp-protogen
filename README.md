# csharp-protogen
[![Build Status](https://img.shields.io/travis/ramosisw/csharp-protogen/master.svg?style=flat-square)](https://travis-ci.org/ramosisw/csharp-protogen)
[![Coverage](https://img.shields.io/codecov/c/github/ramosisw/csharp-protogen.svg?style=flat-square)](https://codecov.io/github/ramosisw/csharp-protogen)
[![License](https://img.shields.io/badge/license-Apache%20License%202.0-blue.svg?style=flat-square)](LICENSE)

Script to parse protobuf *.proto file to C#

# How to use
Put the script on the root of *.csproj that contains the protodef.

## Example
```cmd
solution/
└── protobuf-project/
    ├── protos/
    |   └── message.proto
    ├── protobuf-project.csproj
    └── generate_protos.bat
```

And run the script `generate_protos.bat`

```cmd
cd protobuf-project
generate_protos.bat
````

Output script
```
Determining Version of Google.Protobuf.Tools & Grpc.Tools

Searching *.proto ...

echo found message.proto

done
```
