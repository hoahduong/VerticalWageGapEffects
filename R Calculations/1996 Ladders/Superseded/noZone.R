setwd("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Superseded")
rm(list=ls())

noZone <- read.csv("noZone.csv")

# noZoneCols = c("code", "AsstStoreMgr", "StoreMgr", "AreaMgr", "DistrictMgr",
#               "RegionalMgr", "TopStoreOps")
# 
# attach(noZone)
# avgNZ <- data.frame("Average", mean(AsstStoreMgr), mean(StoreMgr), mean(AreaMgr), mean(DistrictMgr),
#            mean(RegionalMgr), mean(TopStoreOps))
# names(avgNZ) <- noZoneCols
# 
# noZone <- rbind(noZone, avgNZ)

# TRANSPOSE
# first remember the names
code <- noZone$code

# transpose all but the first column (name)
noZoneTrans <- as.data.frame(t(noZone[,-1]))
colnames(noZoneTrans) <- code

# LEVEL 
# Calculate mean and sd
levelAvg = rowMeans(noZoneTrans)
levelSd = apply(noZoneTrans[,1:ncol(noZoneTrans)],1,sd)
level <- cbind(noZoneTrans, levelAvg, levelSd)

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/NoZone/level.jpeg")
jpeg(file=mypath)

x1 <- 1:nrow(level)
plot(x1, levelAvg,
     ylim=range(c(levelAvg-levelSd, levelAvg+levelSd)),
     pch=19, xlab="Positions", ylab="Mean +/- SD",
     main="Pay level"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x1, levelAvg-levelSd, x1, levelAvg+levelSd, length=0.05, angle=90, code=3)

dev.off()

# FIRST DIFFERENCE
# Create dataframe
gap <- c("AsstToStore", "StoreToArea", "AreaToDist", "DistToReg", "RegToTop")
firstDiff <- data.frame(matrix(nrow = nrow(level)-1, ncol = ncol(noZoneTrans)), row.names = gap)

for (i in 1:ncol(noZoneTrans)){
  diff <- diff(level[,i])
  firstDiff[,i] <- diff
}
colnames(firstDiff) <- code

# Calculate mean and sd
firstDiffAvg = rowMeans(firstDiff)
firstDiffSd = apply(firstDiff[,1:ncol(noZoneTrans)],1,sd)
firstDiff <- cbind(firstDiff, firstDiffAvg, firstDiffSd)

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/NoZone/firstDiff.jpeg")
jpeg(file=mypath)

x2 <- 1:(nrow(firstDiff))
plot(x2, firstDiffAvg,
     ylim=range(c(firstDiffAvg-firstDiffSd, firstDiffAvg+firstDiffSd)),
     pch=19, xlab="Positions", ylab="Mean +/- SD",
     main="First Difference"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x1, firstDiffAvg-firstDiffSd, x1, firstDiffAvg+firstDiffSd, length=0.05, angle=90, code=3)

dev.off()

# SECOND DIFFERENCE
# Create dataframe
gap <- c("AsstToStoreVSStoreToArea", "StoreToAreaVSAreaToDist", "AreaToDistVSDistToReg", "DistToRegVSRegToTop")
secondDiff <- data.frame(matrix(nrow = nrow(firstDiff) - 1, ncol = ncol(noZoneTrans)), row.names = gap)

for (i in 1:ncol(noZoneTrans)){
  diff <- diff(diff(level[,i]))
  secondDiff[,i] <- diff
}
colnames(secondDiff) <- code

# Calculate mean and sd
secondDiffAvg = rowMeans(secondDiff)
secondDiffSd = apply(secondDiff[,1:ncol(noZoneTrans)],1,sd)
secondDiff <- cbind(secondDiff, secondDiffAvg, secondDiffSd)

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/NoZone/secondDiff.jpeg")
jpeg(file=mypath)

x3 <- 1:nrow(secondDiff)
plot(x3, secondDiffAvg,
     ylim=range(c(secondDiffAvg-secondDiffSd, secondDiffAvg+secondDiffSd)),
     pch=19, xlab="Positions", ylab="Mean +/- SD",
     main="Second Difference"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x3, secondDiffAvg-secondDiffSd, x3, secondDiffAvg+secondDiffSd, length=0.05, angle=90, code=3)

dev.off()








