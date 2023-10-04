setwd("~/Desktop/18-19 Thesis/R Calculations/1997 Ladders")
rm(list=ls())

noZoneNoArea <- read.csv("noZoneNoArea.csv")

# LEVEL
# Asst Store is reported by hourly wage -> multiply 2080
noZoneNoArea$AsstStoreMgr <- noZoneNoArea$AsstStoreMgr*2080

boxplot(noZoneNoArea[,2:ncol(noZoneNoArea)], xlab="Positions", ylab="Pay level ($)",
        main="Pay level")


# FIRST DIFFERENCE
# Create dataframe
gap1 <- c("Code", "AsstToStore", "StoreToDist", "DistToReg", "RegToTop")
firstDiff <- data.frame(matrix(nrow = nrow(noZoneNoArea), ncol = ncol(noZoneNoArea) - 1), row.names = rownames(noZoneNoArea))
colnames(firstDiff) <- gap1

firstDiff$Code <- noZoneNoArea$code

firstDiff$AsstToStore <- noZoneNoArea$StoreMgr - noZoneNoArea$AsstStoreMgr
firstDiff$StoreToDist <- noZoneNoArea$DistrictMgr - noZoneNoArea$StoreMgr
firstDiff$DistToReg <- noZoneNoArea$RegionalMgr - noZoneNoArea$DistrictMgr
firstDiff$RegToTop <- noZoneNoArea$TopStoreOps - noZoneNoArea$RegionalMgr

boxplot(firstDiff[,2:ncol(firstDiff)], xlab="Positions", ylab="Pay gap ($)",
        main="First Difference")


# SECOND DIFFERENCE
# Create dataframe
gap2 <- c("Code", "AsstToStoreVSStoreToDist", "StoreToDistVSDistToReg", "DistToRegVSRegToTop")
secondDiff <- data.frame(matrix(nrow = nrow(noZoneNoArea), ncol = ncol(firstDiff)-1), row.names = rownames(noZoneNoArea))
colnames(secondDiff) <- gap2

secondDiff$Code <- firstDiff$Code

secondDiff$AsstToStoreVSStoreToDist <- firstDiff$StoreToDist - firstDiff$AsstToStore
secondDiff$StoreToDistVSDistToReg <- firstDiff$DistToReg - firstDiff$StoreToDist
secondDiff$DistToRegVSRegToTop <- firstDiff$RegToTop - firstDiff$DistToReg

boxplot(secondDiff[,2:ncol(secondDiff)], xlab="Positions", ylab="Second pay gap ($)",
        main="Second Difference")


