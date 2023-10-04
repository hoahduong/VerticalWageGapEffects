setwd("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders")

noZoneNoArea <- read.csv("noZoneNoArea.csv")

# TRANSPOSE
# first remember the names
code <- noZoneNoArea$code

# transpose all but the first column (name)
noZoneNoAreaTrans <- as.data.frame(t(noZoneNoArea[,-1]))
colnames(noZoneNoAreaTrans) <- code

# LEVEL 
# Calculate mean and sd
levelAvg = rowMeans(noZoneNoAreaTrans)
levelSd = apply(noZoneNoAreaTrans[,1:27],1,sd)
level <- cbind(noZoneNoAreaTrans, levelAvg, levelSd)

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/noZoneNoArea/level.jpeg")
jpeg(file=mypath)

x1 <- 1:5
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
gap <- c("AsstToStore", "StoreToDist", "DistToReg", "RegToTop")
firstDiff <- data.frame(matrix(nrow = 4, ncol = ncol(noZoneNoAreaTrans)), row.names = gap)

for (i in 1:ncol(noZoneNoAreaTrans)){
  diff <- diff(level[,i])
  firstDiff[,i] <- diff
}
colnames(firstDiff) <- code

# Calculate mean and sd
firstDiffAvg = rowMeans(firstDiff)
firstDiffSd = apply(firstDiff[,1:27],1,sd)
firstDiff <- cbind(firstDiff, firstDiffAvg, firstDiffSd)

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/noZoneNoArea/firstDiff.jpeg")
jpeg(file=mypath)

x2 <- 1:4
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
gap <- c("AsstToStoreVSStoreToDist", "StoreToDistVSDistToReg", "DistToRegVSRegToTop")
secondDiff <- data.frame(matrix(nrow = 3, ncol = ncol(noZoneNoAreaTrans)), row.names = gap)

for (i in 1:ncol(noZoneNoAreaTrans)){
  diff <- diff(diff(level[,i]))
  secondDiff[,i] <- diff
}
colnames(secondDiff) <- code

# Calculate mean and sd
secondDiffAvg = rowMeans(secondDiff)
secondDiffSd = apply(secondDiff[,1:27],1,sd)
secondDiff <- cbind(secondDiff, secondDiffAvg, secondDiffSd)

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/noZoneNoArea/secondDiff.jpeg")
jpeg(file=mypath)

x3 <- 1:3
plot(x3, secondDiffAvg,
     ylim=range(c(secondDiffAvg-secondDiffSd, secondDiffAvg+secondDiffSd)),
     pch=19, xlab="Positions", ylab="Mean +/- SD",
     main="Second Difference"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x3, secondDiffAvg-secondDiffSd, x3, secondDiffAvg+secondDiffSd, length=0.05, angle=90, code=3)

dev.off()



