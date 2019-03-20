# csharp-protogen
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
