FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine3.13

COPY pr-naming.ps1 /

ENTRYPOINT [ "pwsh", "-File", "/pr-naming.ps1"]