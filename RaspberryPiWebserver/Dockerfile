FROM mcr.microsoft.com/dotnet/core/aspnet:3.0-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.0-buster AS build
WORKDIR /src
COPY ["RaspberryPiWebserver/RaspberryPiWebserver/RaspberryPiWebserver.csproj", "RaspberryPiWebserver/"]
RUN dotnet restore "RaspberryPiWebserver/RaspberryPiWebserver.csproj"
COPY . .
WORKDIR "/src/RaspberryPiWebserver"
RUN dotnet build "RaspberryPiWebserver.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "RaspberryPiWebserver.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "RaspberryPiWebserver.dll"]
