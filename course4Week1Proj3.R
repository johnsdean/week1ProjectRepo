# Course 4 Week 1 Project 3

setwd("C:/Users/John/OneDrive/Documents/000 explicitly saved stuff/000rPgms/course4/week1Project")

df <- read.table("household_power_consumption.txt",
  header=TRUE, sep=";", na.strings="?",
  colClasses = c("character", "character", "numeric", "numeric", "numeric",
  "numeric", "numeric", "numeric", "numeric"))

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df2 <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"), ]

DateTime <- strptime(paste(df2$Date, df2$Time, sep=" "),
  "%Y-%m-%d %H:%M:%S")

par(oma=c(0,1,0,0))

plot(x=DateTime, y=df2$Sub_metering_1, col="black",
  xlab="", ylab="", type="l")
points(x=DateTime, y=df2$Sub_metering_2, col="red", type="l")
points(x=DateTime, y=df2$Sub_metering_3, col="blue", type="l")
# Alternative:
# lines(x=DateTime, y=df2$Sub_metering_2, col="red")
# lines(x=DateTime, y=df2$Sub_metering_3, col="blue")

title(ylab="Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty="solid", col = c("black", "red", "blue"),
  cex=.75, y.intersp=.5)

dev.copy(png, file = "week1Proj3.png")
dev.off()