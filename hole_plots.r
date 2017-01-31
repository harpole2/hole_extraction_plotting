hole_graph <- function(directory,  suff="*reduced.dat") {
#libraries
library(stringr)
library(plyr)
library(ggplot2)
library(reshape2)

#file directory
setwd(directory)

#get reduced hole profiles
data = list.files(pattern =suff)

for (i in 1:length(data)){
	#name data frame
	name<-str_locate_all(pattern = "reduced", data[i])
	name<-unlist(name)
	name<-substr(data[1],1,name[1]-2)
	
	#read data
	tmp_table <-read.table(data[i])
	tmp_table <-tmp_table[,1:2]
	tmp_table<- rename(tmp_table, c("V1"="Axis", "V2"=paste(name,"radius",sep="_")))
	assign(name, tmp_table,envir=.GlobalEnv)

	#make plot names
	plot1_name <-paste(name,"plot",sep="_")
	plot2_name<-paste(name,"plot_smooth",sep="_")

	#make plots
	plot <- ggplot(data=tmp_table) +
  		theme_bw() +
 		geom_line(aes(x=Axis, y=radius), size=1.5)

	plot2 <- ggplot(data=tmp_table) +
  		theme_bw() +
  		geom_smooth(aes(x=Axis, y=radius),span=0.05)

	assign(plot1_name,plot,envir=.GlobalEnv)
	assign(plot2_name,plot2,envir=.GlobalEnv)


}


}
