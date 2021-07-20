FROM mcr.microsoft.com/dotnet/sdk:5.0 As build

WORKDIR /application

COPY *.csproj .

RUN dotnet restore

COPY . .
RUN dotnet publish -c Release -o publish

FROM mcr.microsoft.com/dotnet/aspnet:5.0

WORKDIR /application
EXPOSE 80
COPY --from=build /application/publish .
ENTRYPOINT [ "dotnet", "NetCoreDockerAPIRD.dll"]