# ResidentBookmark Database Migrations

## Development

dotnet ef migrations add CreateDevelopmentDatabase -o Migrations\Development \
dotnet ef database update

## Staging

dotnet ef migrations add CreateStagingDatabase -o Migrations\Staging \
dotnet ef database update

## Production 

dotnet ef migrations add CreateProductionDatabase -o Migrations\Production \
dotnet ef database update
