#heatmap of log2 cpm (TMM normalization) for 19 DEGs in Region 2
#using  tutorial:  http://sebastianraschka.com/Articles/heatmaps_in_r.html

#load required  packages 
library(gplots)
library(RColorBrewer)

#set directory
setwd("C:/Users/sverhoff/Dropbox/Dissertation Work/RNA-Seq/EdgeR/heatmap")

#read in data
data<-read.csv("Glyma18G026900_NILSonly_log2cpm.csv",header=TRUE)
rnames <- data[,1]                            # assign labels in column 1 to "rnames"
mat_data <- data.matrix(data[,2:ncol(data)])
rownames(mat_data) <- rnames                  # assign row names

#customize and plot heat map
my_palette <- colorRampPalette(c("red", "yellow", "green"))(n = 299)


heatmap.2(mat_data,
  density.info="none",  # turns off density plot inside color legend
  trace="none",         # turns off trace lines inside the heat map
  col=my_palette,       # use on color palette defined earlier
  dendrogram="none",     # only draw a row dendrogram
  margins = c(8,30),
  Colv="NA")            # turn off column clustering

#if issues use dev.off() in Rstudio prior to calling figure



