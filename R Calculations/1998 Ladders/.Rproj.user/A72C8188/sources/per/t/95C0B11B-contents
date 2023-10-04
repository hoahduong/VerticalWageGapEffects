setwd("~/Desktop/18-19 Thesis/R Calculations/1998 Ladders")
rm(list=ls())

noZone <- read.csv("noZone.csv")
noZoneNoArea <- read.csv("noZoneNoArea.csv")

# Asst Store is reported by hourly wage -> multiply 2080
noZone$AsstStoreMgr <- noZone$AsstStoreMgr*2080
noZoneNoArea$AsstStoreMgr <- noZoneNoArea$AsstStoreMgr*2080

#----------------------------------#
# CALCULATE SECOND DIFFERENCES
#----------------------------------#

# No Zone -------------------------#
gap1NZ <- c("Code", "Stores", "Volume", "Employees", "AsstToStore", 
            "StoreToArea", "AreaToDist", "DistToReg", "RegToTop")
firstDiffNZ <- data.frame(matrix(nrow = nrow(noZone), ncol = ncol(noZone) - 1))
colnames(firstDiffNZ) <- gap1NZ

firstDiffNZ$Code <- noZone$code
firstDiffNZ$Stores <- noZone$stores
firstDiffNZ$Volume <- noZone$volume
firstDiffNZ$Employees <- noZone$employees

firstDiffNZ$AsstToStore <- noZone$StoreMgr - noZone$AsstStoreMgr
firstDiffNZ$StoreToArea <- noZone$AreaMgr - noZone$StoreMgr
firstDiffNZ$AreaToDist <- noZone$DistrictMgr - noZone$AreaMgr
firstDiffNZ$DistToReg <- noZone$RegionalMgr - noZone$DistrictMgr
firstDiffNZ$RegToTop <- noZone$TopStoreOps - noZone$RegionalMgr

# Second Diff -------------------------#
gap2NZ <- c("Code", "Stores", "Volume", "Employees", "AsstToStoreVSStoreToArea",
            "StoreToAreaVSAreaToDist", "AreaToDistVSDistToReg", "DistToRegVSRegToTop")
secondDiffNZ <- data.frame(matrix(nrow = nrow(noZone), ncol = ncol(noZone) - 2))
colnames(secondDiffNZ) <- gap2NZ

secondDiffNZ$Code <- noZone$code
secondDiffNZ$Stores <- noZone$stores
secondDiffNZ$Volume <- noZone$volume
secondDiffNZ$Employees <- noZone$employees

secondDiffNZ$AsstToStoreVSStoreToArea <- firstDiffNZ$StoreToArea - firstDiffNZ$AsstToStore
secondDiffNZ$StoreToAreaVSAreaToDist <- firstDiffNZ$AreaToDist - firstDiffNZ$StoreToArea
secondDiffNZ$AreaToDistVSDistToReg <- firstDiffNZ$DistToReg - firstDiffNZ$AreaToDist
secondDiffNZ$DistToRegVSRegToTop <- firstDiffNZ$RegToTop - firstDiffNZ$DistToReg

# No Zone No Area -------------------------#
gap1NZNA <- c("Code", "Stores", "Volume", "Employees", "AsstToStore", 
              "StoreToDist", "DistToReg", "RegToTop")
firstDiffNZNA <- data.frame(matrix(nrow = nrow(noZoneNoArea), ncol = ncol(noZoneNoArea) - 1))
colnames(firstDiffNZNA) <- gap1NZNA

firstDiffNZNA$Code <- noZoneNoArea$code
firstDiffNZNA$Stores <- noZoneNoArea$stores
firstDiffNZNA$Volume <- noZoneNoArea$volume
firstDiffNZNA$Employees <- noZoneNoArea$employees

firstDiffNZNA$AsstToStore <- noZoneNoArea$StoreMgr - noZoneNoArea$AsstStoreMgr
firstDiffNZNA$StoreToDist <- noZoneNoArea$DistrictMgr - noZoneNoArea$StoreMgr
firstDiffNZNA$DistToReg <- noZoneNoArea$RegionalMgr - noZoneNoArea$DistrictMgr
firstDiffNZNA$RegToTop <- noZoneNoArea$TopStoreOps - noZoneNoArea$RegionalMgr

# Second Diff -------------------------#
gap2NZNA <- c("Code", "Stores", "Volume", "Employees", 
              "AsstToStoreVSStoreToDist", "StoreToDistVSDistToReg", "DistToRegVSRegToTop")
secondDiffNZNA <- data.frame(matrix(nrow = nrow(noZoneNoArea), ncol = ncol(noZoneNoArea) - 2))
colnames(secondDiffNZNA) <- gap2NZNA

secondDiffNZNA$Code <- noZoneNoArea$code
secondDiffNZNA$Stores <- noZoneNoArea$stores
secondDiffNZNA$Volume <- noZoneNoArea$volume
secondDiffNZNA$Employees <- noZoneNoArea$employees

secondDiffNZNA$AsstToStoreVSStoreToDist <- firstDiffNZNA$StoreToDist - firstDiffNZNA$AsstToStore
secondDiffNZNA$StoreToDistVSDistToReg <- firstDiffNZNA$DistToReg - firstDiffNZNA$StoreToDist
secondDiffNZNA$DistToRegVSRegToTop <- firstDiffNZNA$RegToTop - firstDiffNZNA$DistToReg

#----------------------------------#
# CREATE DATAFRAME
#----------------------------------#

colnms <- c("Code", "Structure", "Stores", "Volume")

# No Zone ---------------#
structureNZ <- data.frame(matrix(nrow = nrow(noZone), ncol = 4))
colnames(structureNZ) <- colnms

for (i in 1:nrow(noZone)) {
  structureNZ[i,1] <- noZone[i,1]     # name
  structureNZ[i,3] <- noZone[i,2]     # store
  structureNZ[i,4] <- noZone[i,3]     # volume
  if (secondDiffNZ[i,8] >= 0 && secondDiffNZ[i,5] >= 0 
      && secondDiffNZ[i,6] >= 0 && secondDiffNZ[i,7] >= 0)  {
    structureNZ[i,2] <- 1               # has the structure
  }
  else{
    structureNZ[i,2] <- 0               # does not have the structure
  }
}

# No Zone No Area ---------------#
structureNZNA <- data.frame(matrix(nrow = nrow(noZoneNoArea), ncol = 4))
colnames(structureNZNA) <- colnms

for (i in 1:nrow(noZoneNoArea)) {
  structureNZNA[i,1] <- noZoneNoArea[i,1]     # name
  structureNZNA[i,3] <- noZoneNoArea[i,2]     # store
  structureNZNA[i,4] <- noZoneNoArea[i,3]     # volume
  if (secondDiffNZNA[i,7] >= 0 && secondDiffNZNA[i,5] >= 0 
      && secondDiffNZNA[i,6] >= 0)  {
    structureNZNA[i,2] <- 1               # has the structure
  }
  else{
    structureNZNA[i,2] <- 0               # does not have the structure
  }
}

# All vs 1 negative ---------------#
allStruct <- rbind(structureNZ, structureNZNA)


#----------------------------------#
# REGRESSION
#----------------------------------#
anovaAll <- aov(allStruct$Volume ~ allStruct$Structure)
summary(anovaAll)
t.test(Volume ~ Structure, data = allStruct, var.equal = TRUE)

anovaNZ <- aov(structureNZ$Volume ~ structureNZ$Structure)
summary(anovaNZ)
t.test(Volume ~ Structure, data = structureNZ, var.equal = TRUE)

anovaNZNA <- aov(structureNZNA$Volume ~ structureNZNA$Structure)
summary(anovaNZNA)
t.test(Volume ~ Structure, data = structureNZNA, var.equal = TRUE)

write.csv(structureNZ, file = "structureNZ.csv")
write.csv(structureNZNA, file = "structureNZNA.csv")
write.csv(allStruct, file = "allStruct.csv")

aggregate(structureNZ, by = list(structureNZ$Structure), mean, na.rm = TRUE)
aggregate(structureNZNA, by = list(structureNZNA$Structure), mean, na.rm = TRUE)
aggregate(allStruct, by = list(allStruct$Structure), mean, na.rm = TRUE)
#----------------------------------#
# PLOT
#----------------------------------#
# No Zone
dev.new(width = 3, height = 2)

op <- par(mar = c(5.75,6,3.5,2) + 0.1)

# draw the plot but without annotation
boxplot(structureNZ$Volume / 1000 ~ structureNZ$Structure, 
        col = c("blue", "cyan"),
        main = "Volume Comparison (1998 - Type 1)", axes = FALSE, ann = FALSE)

# add axes and legend
axis(1, at = c(1, 2), 
     labels = c("Partially\n Convex", "Consistently\n Convex"),
     las = 2, cex.axis = 1)
axis(2, at = seq(0, 4000000, by = 250000), las = 2, cex.axis = 1)

title(ylab = "Volume (thousand dollars)", line = 4.5, cex.lab = 1)
box()

par(op)

#dev.off()


# No Zone No Area
dev.new(width = 3, height = 2)

op <- par(mar = c(5.75,6,3.5,2) + 0.1)

# draw the plot but without annotation
boxplot(structureNZNA$Volume / 1000 ~ structureNZNA$Structure,
        col = c("red", "indianred1"),
        main = "Volume Comparison (1998 - Type 2)", axes = FALSE, ann = FALSE)

# add axes and legend
axis(1, at = c(1, 2), 
     labels = c("Partially\n Convex", "Consistently\n Convex"),
     las = 2, cex.axis = 1)
axis(2, at = seq(0, 4000000, by = 500000), las = 2, cex.axis = 1)

title(ylab = "Volume (thousand dollars)", line = 4.5, cex.lab = 1)
box()

par(op)

#dev.off()


# Combined
dev.new(width = 3, height = 2)

op <- par(mar = c(5.75,6,3.5,2) + 0.1)

# draw the plot but without annotation
boxplot(allStruct$Volume / 1000 ~ allStruct$Structure, 
        col = c("forestgreen", "green"),
        main = "Volume Comparison (1998)", axes = FALSE, ann = FALSE)

# add axes and legend
axis(1, at = c(1, 2), 
     labels = c("Partially\n Convex", "Consistently\n Convex"),
     las = 2, cex.axis = 1)
axis(2, at = seq(0, 4000000, by = 500000), las = 2, cex.axis = 1)

title(ylab = "Volume (thousand dollars)", line = 4.5, cex.lab = 1)
box()

par(op)

#dev.off()

