# The main .NET on RHEL image. May be used as-is to BUILD .NET or ASP.NET applications on RHEL.
FROM registry.access.redhat.com/ubi8/dotnet-70 AS build
LABEL author="Eric Lacroix"

# Copy project
WORKDIR /opt/app-root/src
RUN mkdir -p /opt/app-root/src/ResidentBookmark

COPY ResidentBookmark/ResidentBookmark.csproj /opt/app-root/src/ResidentBookmark
COPY ResidentBookmark /opt/app-root/src/ResidentBookmark

# Set owner and fix permissions
USER 0
RUN chown -R 1001:0 /opt/app-root && fix-permissions /opt/app-root
USER 1001

WORKDIR /opt/app-root/src/ResidentBookmark

# Build and publish
RUN dotnet build ResidentBookmark.csproj -c Debug -o build
RUN dotnet publish ResidentBookmark.csproj -c Debug -o publish

# The main .NET on RHEL image. May be used as-is to RUN .NET or ASP.NET applications on RHEL.pwd
FROM registry.access.redhat.com/ubi8/dotnet-70-runtime

# Expose application and set environment
WORKDIR /opt/app-root/src/app

ENV ASPNETCORE_URLS=http://+:5001
ENV DOTNET_ENVIRONMENT=Development
ENV ASPNETCORE_ENVIRONMENT=Development
ENV DOTNET_EnableDiagnostics=0

EXPOSE 5001

# Set owner and fix permissions
USER 0
RUN chown -R 1001:0 /opt/app-root && fix-permissions /opt/app-root
USER 1001

# Get publish content from build
WORKDIR /opt/app-root/src/app
COPY --from=build /opt/app-root/src/ResidentBookmark/publish .

# Run the application
ENTRYPOINT ["dotnet", "ResidentBookmark.dll"]