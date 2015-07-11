## The function plot2, creates a plot of Global Active Power vs specific days.
## The function:
## 1. Read file household_power_consumption.txt called df.
## 2. Subset column called Date and transform it to Date format.
## 3. Add this subset to df and subset by the specific dates.
## 4. Build the plot of Global Active Power vs specific days.
## 5. Copy the plot from screen device to PNG device.
plot2<-function(){
  df<-read.table("household_power_consumption.txt",header=T,sep=";")
  dfDate<-as.Date(df$Date,"%d/%m/%Y")
  df$Date<-NULL
  df$Date<-dfDate
  df1<-df[which(df$Date=="2007-02-01"|df$Date=="2007-02-02"),]
  plot(as.numeric(as.character(df1$Global_active_power)),type="l",ylab="Global Active Power (kilowatts)",xlab="",axes=F)
  axis(1,at=seq(0,2880,1440),lab=c("Thu","Fri","Sat"))
  axis(2,at=c(0,2,4,6))
  box()
  dev.copy(png,file="plot2.png")
  dev.off()
}