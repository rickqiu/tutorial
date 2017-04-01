# Example to read DB data into R
# https://www.rforge.net/RJDBC/

#install.packages("rJava")
#install.packages("RJDBC", dep=TRUE)

Sys.setenv(JAVA_HOME='/jdk1.6.0_43')
options(java.parameters="-Xmx2g")
require(rJava)
require(RJDBC)

# print java env
.jinit()
print(.jcall("java/lang/System", "S", "getProperty", "java.version"))

drv <- JDBC(driverClass="oracle.jdbc.OracleDriver", classPath="lib/ojdbc6.jar")

conn <- dbConnect(drv, "jdbc:oracle:thin:@myhost:1521:orcl", "user", "pwd")

dbSendUpdate(conn, "UPDATE ... ")
result  <- dbGetQuery(conn, "SELECT *  FROM ...")

dbDisconnect(conn)