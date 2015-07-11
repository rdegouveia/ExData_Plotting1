## The function plot1, creates a Histogram of Global Active Power for specific days 2007-02-01 & 2007-02-02.
## The function:
## 1. Read file household_power_consumption.txt called df.
## 2. Subset column called Date and transform it to Date format.
## 3. Add this subset to df and subset by the specific dates.
## 4. Build the histogram of Global Active Power.
## 5. Copy the plot from screen device to PNG device.
plot1<-function(){
  df<-read.table("household_power_consumption.txt",header=T,sep=";")
  dfDate<-as.Date(df$Date,"%d/%m/%Y")
  df$Date<-NULL
  df$Date<-dfDate
  df1<-df[which(df$Date=="2007-02-01"|df$Date=="2007-02-02"),]
  hist(as.numeric(as.character(df1$Global_active_power)),xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
  dev.copy(png,file="plot1.png")
  dev.off()
}