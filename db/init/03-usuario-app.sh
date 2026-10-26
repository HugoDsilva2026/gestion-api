mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "
  CREATE USER 'gestion_app'@'%' IDENTIFIED BY '$APP_DB_PASSWORD';
  GRANT SELECT, INSERT, UPDATE, DELETE ON gestion.* TO 'gestion_app'@'%';"
