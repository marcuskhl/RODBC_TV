if(is.na(match(c("devtools"),installed.packages()[,"Package"]))) install.packages(new.packages) else library(devtools)
suppressMessages(devtools::install_github("marcuskhl/BasicSettings"));suppressMessages(library(BasicSettings))
dev.pkgs()

con <- odbcConnect("TV_Price_Tracker_db")

sqlTables(con, tableType = "TABLE", tableName = "Pricing_Output")$TABLE_NAME
sqlColumns(con, "Pricing_Output")$COLUMN_NAME
x <- sqlFetch(con, "Pricing_Output")
y <- sqlQuery(con, "SELECT * FROM Pricing_Output WHERE `Price ($)` > 300")


odbcCloseAll()