if(!file.exists("./data")) {dir.create("./data")}
file_url <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip"
download.file(file_url, destfile="./data/activity.zip")
pa_data <- read.csv("./activity.csv")
head(pa_data, n=3)
## Tiene NA's
##steps       date interval
##1    NA 2012-10-01        0
##2    NA 2012-10-01        5
##3    NA 2012-10-01       10
tail(pa_data, n=3)
##steps       date interval
##17566    NA 2012-11-30     2345
##17567    NA 2012-11-30     2350
##17568    NA 2012-11-30     2355
summary(pa_data)
##steps                date          interval     
##Min.   :  0.00   2012-10-01:  288   Min.   :   0.0  
##1st Qu.:  0.00   2012-10-02:  288   1st Qu.: 588.8  
##Median :  0.00   2012-10-03:  288   Median :1177.5  
##Mean   : 37.38   2012-10-04:  288   Mean   :1177.5  
##3rd Qu.: 12.00   2012-10-05:  288   3rd Qu.:1766.2  
##Max.   :806.00   2012-10-06:  288   Max.   :2355.0  
##NA's   :2304     (Other)   :15840         
str(pa_data)
##'data.frame':	17568 obs. of  3 variables:
##$ steps   : int  NA NA NA NA NA NA NA NA NA NA ...
##$ date    : Factor w/ 61 levels "2012-10-01","2012-10-02",..: 1 1 1 1 1 1 1 1 1 1 ...
##$ interval: int  0 5 10 15 20 25 30 35 40 45 ...
quantile(pa_data$steps,na.rm=TRUE)
##0%  25%  50%  75% 100% 
##0    0    0   12  806 
quantile(pa_data$steps,na.rm=TRUE,c(0.75,0.80,0.90,0.95,1.00))
##75%    80%    90%    95%   100% 
##12.00  28.00  86.00 252.85 806.00 
sum(is.na(pa_data$steps))
##[1] 2304
sum(is.na(pa_data$interval))
##[1] 0
sum(is.na(pa_data$date))
##[1] 0
colSums(is.na(pa_data))
##steps     date interval 
##2304        0        0 
object.size(pa_data)
##214232 bytes
pa_data_clean <- pa_data[complete.cases(pa_data),]
colSums(is.na(pa_data_clean))
##steps     date interval 
##0        0        0 
summary(pa_data_clean)
##steps                date          interval     
##Min.   :  0.00   2012-10-02:  288   Min.   :   0.0  
##1st Qu.:  0.00   2012-10-03:  288   1st Qu.: 588.8  
##Median :  0.00   2012-10-04:  288   Median :1177.5  
##Mean   : 37.38   2012-10-05:  288   Mean   :1177.5  
##3rd Qu.: 12.00   2012-10-06:  288   3rd Qu.:1766.2  
##Max.   :806.00   2012-10-07:  288   Max.   :2355.0  
##(Other)   :13536                   
str(pa_data_clean)
##'data.frame':	15264 obs. of  3 variables:
##$ steps   : int  0 0 0 0 0 0 0 0 0 0 ...
##$ date    : Factor w/ 61 levels "2012-10-01","2012-10-02",..: 2 2 2 2 2 2 2 2 2 2 ...
##$ interval: int  0 5 10 15 20 25 30 35 40 45 ...
## Otra posibilidad, leer fichero dejando las fechas como string, no como factor
pa_data <- read.csv("./activity.csv",stringsAsFactors = FALSE)
str(pa_data)
##'data.frame':	17568 obs. of  3 variables:
##$ steps   : int  NA NA NA NA NA NA NA NA NA NA ...
##$ date    : chr  "2012-10-01" "2012-10-01" "2012-10-01" "2012-10-01" ...
##$ interval: int  0 5 10 15 20 25 30 35 40 45 ...
##Conversion de date a formato fecha (no hace falta indicar formato en la función)
pa_data_clean$date <- as.Date(pa_data_clean$date)
