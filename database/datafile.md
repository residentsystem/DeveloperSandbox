# ResidentBookmark Database Backup

## Development

### Backup a database With a Timestamp

mysqldump -h rs-wsdv-m92p-01 --port=5507 -u root -p bookmark > ~/database/backup/bookmark-dev-$(date +%Y%m%d).sql

### Backup ALL databases With a Timestamp

mysql --host rs-wsdv-m92p-01 --port=5507 -u root -pPassword -e 'show databases' -s --skip-column-names

for database in $(mysql --host rs-wsdv-m92p-01 --port=5507 -u root -pPassword -e 'show databases' -s --skip-column-names); do {
    mysqldump -h rs-wsdv-m92p-01 --port=5507 -u root -pPassword $database > ~/database/backup/bookmark/$database-dev-$(date +%Y%m%d).sql --single-transaction --skip-lock-tables;
}
done

### Restore a Backup

mysql -h rs-wsdv-m92p-01 --port=5507 -u root bookmark -p < ~/database/backup/bookmark-dev-20221021.sql

## Staging

### Create a Backup With a Timestamp

mysqldump -h rs-wsdv-m92p-01 --port=5507 -u root -p bookmark > ~/database/backup/bookmark-stg-$(date +%Y%m%d).sql

### Restore a Backup

mysql -h rs-wsdv-m92p-01 --port=5507 -u root bookmark -p < ~/database/backup/bookmark-stg-20221021.sql

## Production 

### Create a Backup With a Timestamp

mysqldump -h rs-wsdv-m92p-01 --port=5507 -u root -p bookmark > ~/database/backup/bookmark-prd-$(date +%Y%m%d).sql

### Restore a Backup

mysql -h rs-wsdv-m92p-01 --port=5507 -u root bookmark -p < ~/database/backup/bookmark-prd-20221021.sql