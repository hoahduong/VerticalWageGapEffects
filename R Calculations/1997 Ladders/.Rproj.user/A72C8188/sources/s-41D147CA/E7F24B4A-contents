setwd("~/Desktop/18-19 Thesis/R Calculations/1997 Ladders")
rm(list=ls())

noZone <- read.csv("noZone.csv")
noZoneNoArea <- read.csv("noZoneNoArea.csv")

type <- c("No Zone", "No Zone No Area")

# LEVEL

# Asst Store is reported by hourly wage -> multiply 2080
noZone$AsstStoreMgr <- noZone$AsstStoreMgr*2080
noZoneNoArea$AsstStoreMgr <- noZoneNoArea$AsstStoreMgr*2080

# LEVEL
# Create the dataframe
# No Zone
positionNZ <- colnames(noZone)
levelNZ <- data.frame(matrix(nrow = nrow(noZone), ncol = ncol(noZone)))

colnames(levelNZ) <- positionNZ
levelNZ$code <- noZone$code
levelNZ$stores <- noZone$stores
levelNZ$volume <- noZone$volume
levelNZ$employees <- noZone$employees

for (i in 5:ncol(noZone)){
  for (j in 1:nrow(noZone)){
    standardized <- noZone[j,i]/noZone[j,5]
    levelNZ[j,i] <- standardized
  }
}

# No Zone No Area
positionNZNA <- colnames(noZoneNoArea)
levelNZNA <- data.frame(matrix(nrow = nrow(noZoneNoArea), ncol = ncol(noZoneNoArea)))

colnames(levelNZNA) <- positionNZNA
levelNZNA$code <- noZoneNoArea$code
levelNZNA$stores <- noZoneNoArea$stores
levelNZNA$volume <- noZoneNoArea$volume
levelNZNA$employees <- noZoneNoArea$employees

for (i in 5:ncol(noZoneNoArea)){
  for (j in 1:nrow(noZoneNoArea)){
    standardized <- noZoneNoArea[j,i]/noZoneNoArea[j,5]
    levelNZNA[j,i] <- standardized
  }
}


# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1997 Ladders/Plots/Combined/Standardized Level.jpeg")
jpeg(file=mypath, width = 600, height = 600, units = "px", quality = 100)

#dev.new(width = 3, height = 2)

op <- par(mar = c(5.5,5.5,3.5,2) + 0.1)

# draw the plot but without annotation
boxplot(noZone$AsstStoreMgr, noZoneNoArea$AsstStoreMgr, 
        noZone$StoreMgr, noZoneNoArea$StoreMgr, 
        noZone$AreaMgr,
        noZone$DistrictMgr, noZoneNoArea$DistrictMgr,
        noZone$RegionalMgr, noZoneNoArea$RegionalMgr,
        noZone$TopStoreOps, noZoneNoArea$TopStoreOps,
        at = c(1,2, 4,5, 7, 9,10, 12,13, 15,16),
        col = c("blue", "red", "blue", "red", "blue",
                "blue", "red", "blue", "red", "blue", "red"), 
        main = "Level", axes = FALSE, ann = FALSE)

# add axes and legend
legend("topleft", type, fill = c("blue", "red"))
axis(1, at = c(1.5, 4.5, 7, 9.5, 12.5, 15.5), 
     labels = c("Assistant \n Store Mgr",
                "Store Mgr", 
                "Area Mgr", 
                "District\n Mgr   ", 
                "Regional\n Mgr   ",
                "Top Store \n Operations"), las = 2, cex.axis = 1)
axis(2, at = seq(0, 500000, by = 50000), las = 2, cex.axis = 1)

title(ylab = "Standardized Pay Level", line = 4.25, cex.lab = 1)
box()

par(op)

dev.off()

# FIRST DIFFERENCE

# Create dataframe
# No Zone
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

# No Zone No Area
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

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1997 Ladders/Plots/Combined/Standardized First Difference.jpeg")
jpeg(file=mypath, width = 600, height = 600, units = "px", quality = 100)

#dev.new(width = 3, height = 2)

op <- par(mar = c(5,5.5,3.5,2) + 0.1)

# draw the plot but without annotation
boxplot(firstDiffNZ$AsstToStore, firstDiffNZNA$AsstToStore,
        firstDiffNZ$StoreToArea, firstDiffNZ$AreaToDist,
        firstDiffNZNA$StoreToDist,
        firstDiffNZ$DistToReg, firstDiffNZNA$DistToReg,
        firstDiffNZ$RegToTop, firstDiffNZNA$RegToTop,
        at = c(1,2, 4,5,6, 8,9, 11,12),
        col = c("blue", "red", "blue", "blue", "red",
                "blue", "red", "blue", "red"), 
        main = "Standardized First Difference", axes = FALSE, ann = FALSE)

# add axes and legend
legend("topleft", type, fill = c("blue", "red"))
axis(1, at = c(1.5, 4,5,6, 8.5, 11.5), 
     labels = c("Assistant\n to Store",
                "Store to\n Area    ", "Area to\n District",
                "Store to\n District", 
                "District to\n Regional",
                "Regional\n to Top"), las = 2, cex.axis = 1)
axis(2, at = seq(-100000, 400000, by = 50000), las = 2, cex.axis = 1)

title(ylab = "Standardized Pay Gap", line = 4, cex.lab = 1)
box()

par(op)

dev.off()


# SECOND DIFFERENCE

# Create dataframe
# No Zone
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

# No Zone No Area
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

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1997 Ladders/Plots/Combined/Standardized Second Difference.jpeg")
jpeg(file=mypath, width = 600, height = 600, units = "px", quality = 100)

#dev.new(width = 3, height = 2)

op <- par(mar = c(7.5,5,3.5,2) + 0.1)

# draw the plot but without annotation
boxplot(secondDiffNZ$AsstToStoreVSStoreToArea, 
        secondDiffNZ$StoreToAreaVSAreaToDist,
        secondDiffNZNA$AsstToStoreVSStoreToDist, 
        
        secondDiffNZ$AreaToDistVSDistToReg,
        secondDiffNZNA$StoreToDistVSDistToReg, 
        
        secondDiffNZ$DistToRegVSRegToTop, 
        secondDiffNZNA$DistToRegVSRegToTop,
        
        at = c(1,2,3, 5,6, 8,9),
        col = c("blue", "blue", "red", "blue", "red",
                "blue", "red"), 
        main = "Standardized Second Difference", axes = FALSE, ann = FALSE)

# add axes and legend
legend("topleft", type, fill = c("blue", "red"))
axis(1, at = c(1,2,3, 5,6, 8.5), 
     labels = c("Asst to Store \n vs. Store to Area",
                "Store to Area \n vs. Area to Dist",
                "Asst to Store \n vs. Store to Dist",
                
                "Area to Dist \n vs. Dist to Reg",
                "Store to Dist \n vs. Dist to Reg",
                
                "Dist to Reg \n vs. Reg to Top"), las = 2, cex.axis = 1)
axis(2, at = seq(-400000, 400000, by = 50000), las = 2, cex.axis = 1)

title(ylab = "Standardized Difference between Pay Gaps", line = 4, cex.lab = 1)
box()

par(op)

dev.off()


# T-TEST
# No Zone
t.test(secondDiffNZ$AsstToStoreVSStoreToArea, alternative = "greater")
t.test(secondDiffNZ$StoreToAreaVSAreaToDist, alternative = "greater")
t.test(secondDiffNZ$AreaToDistVSDistToReg, alternative = "greater")
t.test(secondDiffNZ$DistToRegVSRegToTop, alternative = "greater")

# No Zone No Area
t.test(secondDiffNZNA$AsstToStoreVSStoreToDist, alternative = "greater")
t.test(secondDiffNZNA$StoreToDistVSDistToReg, alternative = "greater")
t.test(secondDiffNZNA$DistToRegVSRegToTop, alternative = "greater")



# REGRESSION
# No Zone
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$AsstToStoreVSStoreToArea))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$StoreToAreaVSAreaToDist))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$AreaToDistVSDistToReg))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$DistToRegVSRegToTop))

# Control for store
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$AsstToStoreVSStoreToArea
           + secondDiffNZ$Stores))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$StoreToAreaVSAreaToDist
           + secondDiffNZ$Stores))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$AreaToDistVSDistToReg
           + secondDiffNZ$Stores))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$DistToRegVSRegToTop
           + secondDiffNZ$Stores))

# Control for store and employees
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$AsstToStoreVSStoreToArea
           + secondDiffNZ$Stores + secondDiffNZ$Employees))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$StoreToAreaVSAreaToDist
           + secondDiffNZ$Stores + secondDiffNZ$Employees))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$AreaToDistVSDistToReg
           + secondDiffNZ$Stores + secondDiffNZ$Employees))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$DistToRegVSRegToTop
           + secondDiffNZ$Stores + secondDiffNZ$Employees))


# No Zone No Area
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$AsstToStoreVSStoreToDist))
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$StoreToDistVSDistToReg))
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$DistToRegVSRegToTop))

# Control for stores
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$AsstToStoreVSStoreToDist
           + secondDiffNZNA$Stores))
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$StoreToDistVSDistToReg
           + secondDiffNZNA$Stores))
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$DistToRegVSRegToTop
           + secondDiffNZNA$Stores))

# Control for store and employees
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$AsstToStoreVSStoreToDist
           + secondDiffNZNA$Stores + secondDiffNZNA$Employees))
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$StoreToDistVSDistToReg
           + secondDiffNZNA$Stores + secondDiffNZNA$Employees))
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$DistToRegVSRegToTop
           + secondDiffNZNA$Stores + secondDiffNZNA$Employees))


# REGRESSION ON AVERAGE
# No Zone
avgNZ <- rowMeans(secondDiffNZ[,5:8])
secondDiffNZ <- cbind(secondDiffNZ, avgNZ)
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$avgNZ))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$avgNZ + secondDiffNZ$Stores))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$avgNZ 
           + secondDiffNZ$Stores + secondDiffNZ$Employees))


# No Zone No Area
avgNZNA <- rowMeans(secondDiffNZNA[,5:7])
secondDiffNZNA <- cbind(secondDiffNZNA, avgNZNA)
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$avgNZNA 
           + secondDiffNZNA$Stores))
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$avgNZNA 
           + secondDiffNZNA$Stores + secondDiffNZNA$Employees))

