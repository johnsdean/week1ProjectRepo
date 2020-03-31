# Course 4 Week 1 Project code

setwd("C:/Users/John/OneDrive/Documents/000 explicitly saved stuff/000rPgms/course4/week1Project")

# Looking at the downloaded file's content, here is my RAM calculation:
# 2,075,259 rows * [10 + 8 bytes (for the two character variables) +
#   7 * 8 bytes (for the numeric variables)] = 153 MB

# I manually downloaded and unzipped the following file.

df <- read.table("household_power_consumption.txt",
  header=TRUE, sep=";", na.strings="?",
  colClasses = c("character", "character", "numeric", "numeric", "numeric",
  "numeric", "numeric", "numeric", "numeric"))

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df$Time <- strptime(df$Time, format="%H:%M:%S")
df2 <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"), ]
# Alternative:
# df3 <- subset(df, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

hist(df2$Global_active_power, col="red", main="", xlab="",
  xlim=c(0,6))
title(main="Global Active Power", xlab="Global Active Power (kilowatts)")

# I couldn't get these axis functions to work:
# axis(1, at=seq(0, 6, by=2))
# axis(2, at=seq(0, 1200, by=200), labels=c("0", "200"))

dev.copy(png, file = "week1Proj1.png")
dev.off()