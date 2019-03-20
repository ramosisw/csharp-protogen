@rem Copyright 2016 gRPC authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem     http://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.

@rem Generate the C# code for .proto files

@echo off
setlocal

@rem enter this directory
cd /d %~dp0

echo Determining Version of Google.Protobuf.Tools ^& Grpc.Tools
SET PROTOC_V=3.7.0
SET PLUGIN_V=1.19.0
for /F "tokens=3,5 usebackq delims== " %%i in (sanval-gateway-proto.csproj) DO (
    if %%i == "Google.Protobuf.Tools" (
        echo found %%~i v%%~j
        SET PROTOC_V=%%~j
    )
    if %%i == "Grpc.Tools" (
        echo found %%~i v%%~j
        SET PLUGIN_V=%%~j
    )
)

@rem packages will be available in nuget cache directory once the project is built or after "dotnet restore"
set "PROTOC=%UserProfile%\.nuget\packages\Google.Protobuf.Tools\%PROTOC_V%\tools\windows_x64\protoc.exe"
set "PLUGIN=%UserProfile%\.nuget\packages\Grpc.Tools\%PLUGIN_V%\tools\windows_x64\grpc_csharp_plugin.exe"
SET ERR=0

IF NOT EXIST %PROTOC% (
    echo Package Google.Protobuf.Tools v%PROTOC_V%  not found please install
    SET ERR=1
)

IF NOT EXIST %PLUGIN% (
    echo Package Grpc.Tools v%PLUGIN_V% not found please install
    SET ERR=1
)

IF NOT %ERR% == 0 ( GOTO EOF )


echo.
echo Searching *.proto ...
echo.


FOR /F %%D in ('dir /S /A /B *.proto') DO (
    echo found %%~nD%%~xD
    @rem echo --proto_path %~dp0 --csharp_out %%~dD%%~pD %%D --grpc_out %%~dD%%~pD
    %PROTOC% --proto_path %~dp0 --csharp_out %%~dD%%~pD %%D --grpc_out %%~dD%%~pD --plugin=protoc-gen-grpc=%PLUGIN%
)

echo.
echo done

:EOF
endlocal
