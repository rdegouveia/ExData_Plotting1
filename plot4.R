## The function plot4, creates 4 plot and put them all together in one PNG file.
## Plot1: Global Active Power vs Specific days (obtained with function plot2).
## Plot2: Voltage vs Specific days (see code below).
## Plot3: Energy sub metering vs Specific days (obtained with function plot3).
## Plot4: Global reactive power vs Specific days (see code below).

## The function:
## 1. Fix the margins and numbers of plot per screen device.
## 2. Source and call plot2.
## 3. Plot Voltage vs Specific days
## 4. Source and call plot3.
## 5. Plot Global reactive power vs Specific days
## 5. Copy the plot from screen device to PNG device
plot4<-function(){
  par(mar=c(4,4,2,2))
  par(mfrow=c(2,2))
  source('~/plot2.R')
  plot2()
  plot(as.numeric(as.character(df1$Voltage)),type="l",ylab="Voltage",xlab="datetime",axes=F)
  axis(1,at=seq(0,2880,1440),lab=c("Thu","Fri","Sat"))
  axis(2,at=c(234,238,242,246))
  box()
  source('~/plot3.R')
  plot3()
  plot(as.numeric(as.character(df1$Global_reactive_power)),type="l",ylab="Global_reactive_power",xlab="datetime",axes=F)
  axis(1,at=seq(0,2880,1440),lab=c("Thu","Fri","Sat"))
  axis(2,at=c(0.0,0.1,0.2,0.3,0.4,0.5))
  box()
  dev.copy(png,file="plot4.png")
  dev.off()
}
  