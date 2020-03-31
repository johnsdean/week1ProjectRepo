# Course 4 Week 1 Project 4

setwd("C:/Users/John/OneDrive/Documents/000 explicitly saved stuff/000rPgms/course4/week1Project")

df <- read.table("household_power_consumption.txt",
  header=TRUE, sep=";", na.strings="?",
  colClasses = c("character", "character", "numeric", "numeric", "numeric",
  "numeric", "numeric", "numeric", "numeric"))

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df2 <- df[df$Date >= as.Date("2007-02-01") & df$Date <= as.Date("2007-02-02"), ]

DateTime <- strptime(paste(df2$Date, df2$Time, sep=" "),
  "%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

plot(x=DateTime, y=df2$Global_active_power, xlab="",
  ylab="Global Active Power", type="l")

plot(x=DateTime, y=df2$Voltage,
  ylab="Voltage", type="l")

plot(x=DateTime, y=df2$Sub_metering_1, col="black",
  xlab="", ylab="Energy sub metering", type="l")
lines(x=DateTime, y=df2$Sub_metering_2, col="red")
lines(x=DateTime, y=df2$Sub_metering_3, col="blue")

#  cex=.75, y.intersp=.5)

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
  lty="solid", col = c("black", "red", "blue"),
  cex=.75, y.intersp=.25, bty="n", xjust=1)
# Above, adding xjust=1 to the legend function doesn't work.

plot(x=DateTime, y=df2$Global_reactive_power,
  ylab="Global Reactive Power", type="l")

dev.copy(png, file = "week1Proj4.png")
dev.off()