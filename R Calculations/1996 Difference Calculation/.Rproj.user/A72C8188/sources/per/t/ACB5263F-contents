setwd("~/Desktop/18-19 Thesis/R Calculations/1996 Difference Calculation")

data = list(NA)

comps = c("BRO",
          "CAM",
          "CAT",
          "COA",
          "COU",
          "DRE",
          "FAM",
          "GAN",
          "GEN",
          "MAU",
          "MOD",
          "ONE",
          "PRI",
          "REC")

for (i in comps){
  data[[i]] <- read.csv(paste("NoZone/", i ,".csv", sep = ""))
  
  # Plot pay level
  mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Difference Calculation/Plots/NoZone/Level/",paste(i, ".jpeg", sep = ""))
  
  jpeg(file=mypath)
  myTitle = paste("Pay level for ", i)
  
  plot(data[[i]]$total, main = myTitle, ylab = "Pay level")
  dev.off()
  
  # Plot first difference
  mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Difference Calculation/Plots/NoZone/FirstDiff/",paste(i, ".jpeg", sep = ""))
  
  jpeg(file=mypath)
  myTitle = paste("First difference for ", i)
  
  plot(data[[i]]$firstDiff, main = myTitle, ylab = "First Difference")
  dev.off()
  
  # Plot second difference
  mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Difference Calculation/Plots/NoZone/SecondDiff/",paste(i, ".jpeg", sep = ""))
  
  jpeg(file=mypath)
  myTitle = paste("Second difference for ", i)
  
  plot(data[[i]]$secondDiff, main = myTitle, ylab = "Second Difference")
  dev.off()
}

