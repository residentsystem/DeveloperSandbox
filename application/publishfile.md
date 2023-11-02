# ResidentBookmark Publishing

dotnet clean
dotnet restore

## Development

dotnet run --urls=http://localhost:5000 --environment Development
dotnet build --configuration Debug \
dotnet publish -c Debug -o "/tmp/publish/ResidentBookmark/Debug"

## Staging

dotnet run --urls=http://localhost:6000 --environment Staging
dotnet build --configuration Debug \
dotnet publish -c Debug -o "/tmp/publish/ResidentBookmark/Debug"

## Production

dotnet run --urls=http://localhost:8000 --environment Production
dotnet build --configuration Release \
dotnet publish -c Release -o "/tmp/publish/ResidentBookmark/Release"