# Course 4 Week 1 Project 2

setwd("C:/Users/John/OneDrive/Documents/000 explicitly saved stuff/000rPgms/course4/week1Project")

df <- read.table("household_power_consumption.txt",
  header=TRUE, sep=";", na.strings="?",
  colClasses = c("character", "character", "numeric", "numeric", "numeric",
  "numeric", "numeric", "numeric", "numeric"))

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df2 <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"), ]

DateTime <- strptime(paste(df2$Date, df2$Time, sep=" "),
  "%Y-%m-%d %H:%M:%S")

plot(x=DateTime, y=df2$Global_active_power, xlab="",
  ylab="Global Active Power (kilowatts)", type="l")

# Alternative:
# df3 <- cbind(DateTime, df2)
# plot(df3$Global_active_power ~ df3$DateTime, xlab="",
#   ylab="Global Active Power (kilowatts)", type="l")

dev.copy(png, file = "week1Proj2.png")
dev.off()