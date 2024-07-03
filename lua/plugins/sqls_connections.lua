-- Connection strings to data bases for Sqls plugin.
return {
  -- MySQL
  {
    alias = "my",
    driver = "mysql",
    dataSourceName = "root:@2z^5#CgYqJAqH@tcp(127.0.0.1:3306)/world",
  },
  -- MS SQL Server
  {
    alias = "ms",
    driver = "mssql",
    dataSourceName = "odbc:server=DENIS-PC\\SQLEXPRESS;user id=sa;password={m8&#n9^7*&ipW2};database=master",
    -- "Server=DENIS-PC\\SQLEXPRESS,51012;User Id=sa;Password=m8&#n9^7*&ipW2;Database=master;TrustServerCertificate=True;",
  },
  -- PostgreSQL
  {
    alias = "pg",
    driver = "postgresql",
    dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=u#bK6Vp@D!8@8z dbname=postgres sslmode=disable",
  },
}

