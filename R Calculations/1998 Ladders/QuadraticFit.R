setwd("~/Desktop/18-19 Thesis/R Calculations/1998 Ladders")
rm(list=ls())

noZone <- read.csv("noZone.csv")
noZoneNoArea <- read.csv("noZoneNoArea.csv")

# Asst Store is reported by hourly wage -> multiply 2080
noZone$AsstStoreMgr <- noZone$AsstStoreMgr*2080
noZoneNoArea$AsstStoreMgr <- noZoneNoArea$AsstStoreMgr*2080

# CREATE DATAFRAME
# No Zone
levelNZ <- data.frame(matrix(nrow = nrow(noZone)*(ncol(noZone) - 4), ncol = 2))
colnames(levelNZ) <- c("Position", "Level")

for (j in 5:ncol(noZone)){
  if (j == 5){
    for (i in 1:nrow(noZone)){
      levelNZ[i, 1] <- j - 4
      levelNZ[i, 2] <- noZone[i,j]
    }
  }
  if (j == 6){
    for (i in 1:nrow(noZone)){
      levelNZ[i + nrow(noZone), 1] <- j - 4
      levelNZ[i + nrow(noZone), 2] <- noZone[i,j]
    }
  }
  if (j == 7){
    for (i in 1:nrow(noZone)){
      levelNZ[i + 2*nrow(noZone), 1] <- j - 4
      levelNZ[i + 2*nrow(noZone), 2] <- noZone[i,j]
    }
  }
  if (j == 8){
    for (i in 1:nrow(noZone)){
      levelNZ[i + 3*nrow(noZone), 1] <- j - 4
      levelNZ[i + 3*nrow(noZone), 2] <- noZone[i,j]
    }
  }
  if (j == 9){
    for (i in 1:nrow(noZone)){
      levelNZ[i + 4*nrow(noZone), 1] <- j - 4
      levelNZ[i + 4*nrow(noZone), 2] <- noZone[i,j]
    }
  }
  if (j == 10){
    for (i in 1:nrow(noZone)){
      levelNZ[i + 5*nrow(noZone), 1] <- j - 4
      levelNZ[i + 5*nrow(noZone), 2] <- noZone[i,j]
    }
  }
}

# No Zone No Area
levelNZNA <- data.frame(matrix(nrow = nrow(noZoneNoArea)*(ncol(noZoneNoArea) - 4), ncol = 2))
colnames(levelNZNA) <- c("Position", "Level")

for (j in 5:ncol(noZoneNoArea)){
  if (j == 5){
    for (i in 1:nrow(noZoneNoArea)){
      levelNZNA[i, 1] <- j - 4
      levelNZNA[i, 2] <- noZoneNoArea[i,j]
    }
  }
  if (j == 6){
    for (i in 1:nrow(noZoneNoArea)){
      levelNZNA[i + nrow(noZoneNoArea), 1] <- j - 4
      levelNZNA[i + nrow(noZoneNoArea), 2] <- noZoneNoArea[i,j]
    }
  }
  if (j == 7){
    for (i in 1:nrow(noZoneNoArea)){
      levelNZNA[i + 2*nrow(noZoneNoArea), 1] <- j - 4
      levelNZNA[i + 2*nrow(noZoneNoArea), 2] <- noZoneNoArea[i,j]
    }
  }
  if (j == 8){
    for (i in 1:nrow(noZoneNoArea)){
      levelNZNA[i + 3*nrow(noZoneNoArea), 1] <- j - 4
      levelNZNA[i + 3*nrow(noZoneNoArea), 2] <- noZoneNoArea[i,j]
    }
  }
  if (j == 9){
    for (i in 1:nrow(noZoneNoArea)){
      levelNZNA[i + 4*nrow(noZoneNoArea), 1] <- j - 4
      levelNZNA[i + 4*nrow(noZoneNoArea), 2] <- noZoneNoArea[i,j]
    }
  }
}

# FIT QUADRATIC MODEL
modelNZ <- lm(levelNZ$Level ~ poly(levelNZ$Position,2))
modelNZNA <- lm(levelNZNA$Level ~ poly(levelNZNA$Position,2))
#----------------------------------#
# PLOT
#----------------------------------#

# No Zone
#mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1998 Ladders/Plots/Level Regression/NoZone.jpeg")
#jpeg(file=mypath, width = 600, height = 600, units = "px", quality = 100)

dev.new(width = 3, height = 2)
op <- par(mar = c(5.5,5.5,3.5,2) + 0.1)

timevalues <- seq(0, 30, 0.1)
predictedNZ <- predict(modelNZ)
plot(levelNZ$Position, levelNZ$Level, col = "blue",
     axes = FALSE, ann = FALSE)

lines(levelNZ$Position, predictedNZ, col = "purple", lwd = 3)

# add axes
axis(1, at = c(1,2,3,4,5,6), 
     labels = c("Assistant \n Store \n Manager",
                "Store \nManager", 
                "Area \nManager", 
                "District\n Manager", 
                "Regional\n Manager",
                "Head of \n Stores"), las = 2, cex.axis = 1)
axis(2, at = seq(0, 400000, by = 50000), las = 2, cex.axis = 1)

title(ylab = "Pay level ($)", line = 4.25, cex.lab = 1)
title(main = "Quadratic Fit to Pay Level (1998 - Type 1)")
box()
par(op)

#dev.off()

# No Zone No Area
#mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1998 Ladders/Plots/Level Regression/NoZoneNoArea.jpeg")
#jpeg(file=mypath, width = 600, height = 600, units = "px", quality = 100)

dev.new(width = 3, height = 2)
op <- par(mar = c(5.5,5.5,3.5,2) + 0.1)

timevalues <- seq(0, 30, 0.1)
predictedNZNA <- predict(modelNZNA)
plot(levelNZNA$Position, levelNZNA$Level, col = "red",
     axes = FALSE, ann = FALSE)

lines(levelNZNA$Position, predictedNZNA, col = "darkgreen", lwd = 3)

# add axes
axis(1, at = c(1,2,3,4,5), 
     labels = c("Assistant \n Store \n Manager",
                "Store \nManager", 
                "District\n Manager", 
                "Regional\n Manager",
                "Head of \n Stores"), las = 2, cex.axis = 1)
axis(2, at = seq(0, 400000, by = 50000), las = 2, cex.axis = 1)

title(ylab = "Pay level ($)", line = 4.25, cex.lab = 1)
title(main = "Quadratic Fit to Pay Level (1998 - Type 2)")
box()
par(op)

#dev.off()

#----------------------------------#
# SUMMARY
#----------------------------------#

summary(modelNZ)
summary(modelNZNA)

