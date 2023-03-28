install.packages("RSQLite")

#create a database
library(RSQLite)
con <- dbConnect(SQLite(), dbname = "mydb.sqlite")

#create a table and insert data
data(mtcars)
dbWriteTable(con, "mtcars", mtcars)

#Update a record in a table
dbExecute(con, "UPDATE mtcars SET mpg = 21 WHERE ROWID = 3")

#search records
res <- dbSendQuery(con, "SELECT * FROM mtcars WHERE mpg > 20")
data <- dbFetch(res)

data

#delete a record
dbExecute(con, "DELETE FROM mtcars WHERE mpg = 22.8")

mtcars

#export
write.csv(data, "mtcars.csv", row.names = FALSE)


