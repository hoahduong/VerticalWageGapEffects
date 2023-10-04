setwd("~/Desktop/18-19 Thesis/R Calculations/1996 Difference Calculation")

#BAK <- read.csv("NoZoneNoArea/BAK.csv")
#plot(BAK$payGap)

#BIL <- read.csv("NoZoneNoArea/BIL.csv")
#plot(BIL$payGap)

data = list(NA)

comps = c("BAK", "BIL", "BOM", "BRI", "CAR", "CHA", "CMA", "EDD", "FLA",
          "FOO", "JBA", "JRI", "KIN", "LAN", "LEC", "LIZ", "MIL", "MUS",
          "PAR", "PET", "POT", "REE", "REN", "SCA", "STE", "TAL", "WMS")

for (i in comps){
  data[[i]] <- read.csv(paste("NoZoneNoArea/", i ,".csv", sep = ""))
  
  # Plot pay level
  mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Difference Calculation/Plots/NoZoneNoArea/Level/",paste(i, ".jpeg", sep = ""))
  
  jpeg(file=mypath)
  myTitle = paste("Pay level for ", i)
  
  plot(data[[i]]$total, main = myTitle, ylab = "Pay level")
  dev.off()
  
  # Plot first difference
  mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Difference Calculation/Plots/NoZoneNoArea/FirstDiff/",paste(i, ".jpeg", sep = ""))
  
  jpeg(file=mypath)
  myTitle = paste("First difference for ", i)
  
  plot(data[[i]]$firstDiff, main = myTitle, ylab = "First Difference")
  dev.off()
  
  # Plot second difference
  mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Difference Calculation/Plots/NoZoneNoArea/SecondDiff/",paste(i, ".jpeg", sep = ""))
  
  jpeg(file=mypath)
  myTitle = paste("Second difference for ", i)
  
  plot(data[[i]]$secondDiff, main = myTitle, ylab = "Second Difference")
  dev.off()
}

for (i in comps){
  # Summary 
  
}

