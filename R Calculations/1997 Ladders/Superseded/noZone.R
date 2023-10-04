setwd("~/Desktop/18-19 Thesis/R Calculations/1997 Ladders")
rm(list=ls())

noZone <- read.csv("noZone.csv")

# LEVEL
# Asst Store is reported by hourly wage -> multiply 2080
noZone$AsstStoreMgr <- noZone$AsstStoreMgr*2080

boxplot(noZone[,2:ncol(noZone)], xlab="Positions", ylab="Pay level ($)",
        main="Pay level")


# FIRST DIFFERENCE
# Create dataframe
gap1 <- c("Code", "AsstToStore", "StoreToArea", "AreaToDist", "DistToReg", "RegToTop")
firstDiff <- data.frame(matrix(nrow = nrow(noZone), ncol = ncol(noZone) - 1), row.names = rownames(noZone))
colnames(firstDiff) <- gap1

firstDiff$Code <- noZone$code

firstDiff$AsstToStore <- noZone$StoreMgr - noZone$AsstStoreMgr
firstDiff$StoreToArea <- noZone$AreaMgr - noZone$StoreMgr
firstDiff$AreaToDist <- noZone$DistrictMgr - noZone$AreaMgr
firstDiff$DistToReg <- noZone$RegionalMgr - noZone$DistrictMgr
firstDiff$RegToTop <- noZone$TopStoreOps - noZone$RegionalMgr

boxplot(firstDiff[,2:ncol(firstDiff)], xlab="Positions", ylab="Pay gap ($)",
        main="First Difference")


# SECOND DIFFERENCE
# Create dataframe
gap2 <- c("Code", "AsstToStoreVSStoreToArea", "StoreToAreaVSAreaToDist", "AreaToDistVSDistToReg", "DistToRegVSRegToTop")
secondDiff <- data.frame(matrix(nrow = nrow(noZone), ncol = ncol(firstDiff)-1), row.names = rownames(noZone))
colnames(secondDiff) <- gap2

secondDiff$Code <- firstDiff$Code

secondDiff$AsstToStoreVSStoreToArea <- firstDiff$StoreToArea - firstDiff$AsstToStore
secondDiff$StoreToAreaVSAreaToDist <- firstDiff$AreaToDist - firstDiff$StoreToArea
secondDiff$AreaToDistVSDistToReg <- firstDiff$DistToReg - firstDiff$AreaToDist
secondDiff$DistToRegVSRegToTop <- firstDiff$RegToTop - firstDiff$DistToReg

boxplot(secondDiff[,2:ncol(secondDiff)], xlab="Positions", ylab="Second pay gap ($)",
        main="Second Difference")


