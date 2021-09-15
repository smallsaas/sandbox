ARG NETCORE_APP_NAME
FROM mcr.microsoft.com/dotnet/runtime:5.0 AS base

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ./src .
RUN dotnet restore "${NETCORE_APP_NAME}.csproj"
RUN dotnet build "${NETCORE_APP_NAME}.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "${NETCORE_APP_NAME}.csproj" -c Release -o /app/publish


FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "${NETCORE_APP_NAME}.dll"]
