## The function plot3, creates a plot of Energy sub metering vs specific days.
## The function:
## 1. Read file household_power_consumption.txt called df.
## 2. Subset column called Date and transform it to Date format.
## 3. Add this subset to df and subset by the specific dates.
## 4. Build the plot of Energy sub metering vs specific days.
## 5. Copy the plot from screen device to PNG device.
plot3<-function(){
  df<-read.table("household_power_consumption.txt",header=T,sep=";")
  dfDate<-as.Date(df$Date,"%d/%m/%Y")
  df$Date<-NULL
  df$Date<-dfDate
  df1<-df[which(df$Date=="2007-02-01"|df$Date=="2007-02-02"),]
  plot(as.numeric(as.character(df1$Sub_metering_1)),type="l",ylab="Energy sub metering",xlab="",axes=F)
  lines(as.numeric(as.character(df1$Sub_metering_2)),type="l",col="red")
  lines(as.numeric(as.character(df1$Sub_metering_3)),type="l",col="blue")
  axis(1,at=seq(0,2880,1440),lab=c("Thu","Fri","Sat"))
  axis(2,at=c(0,10,20,30))
  box()
  legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),cex=0.55)
  dev.copy(png,file="plot3.png")
  dev.off()
}
