setwd("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders")

noZoneNoArea <- read.csv("noZoneNoArea.csv")

# TRANSPOSE
# first remember the names
code <- noZoneNoArea$code

# transpose all but the first column (name)
noZoneNoAreaTrans <- as.data.frame(t(noZoneNoArea[,-1]))
colnames(noZoneNoAreaTrans) <- code

# LEVEL
# Create standardized dataframe
position <- row.names(noZoneNoAreaTrans)
levelStd <- data.frame(matrix(nrow = nrow(noZoneNoAreaTrans), ncol = ncol(noZoneNoAreaTrans)), row.names = position)

for (i in 1:ncol(noZoneNoAreaTrans)){
  for (j in 1:nrow(noZoneNoAreaTrans)){
    standardized <- noZoneNoAreaTrans[j,i]/noZoneNoAreaTrans[1,i]
    levelStd[j,i] <- standardized
  }
}
colnames(levelStd) <- code

# Calculate mean and sd
levelAvg = rowMeans(levelStd)
levelSd = apply(levelStd[,1:ncol(levelStd)],1,sd)
level <- cbind(levelStd, levelAvg, levelSd)

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/noZoneNoArea/levelStd.jpeg")
jpeg(file=mypath)

x1 <- 1:nrow(level)
plot(x1, levelAvg,
     ylim=range(c(levelAvg-levelSd, levelAvg+levelSd)),
     pch=19, xlab="Positions", ylab="Mean +/- SD",
     main="Standardized Pay level"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x1, levelAvg-levelSd, x1, levelAvg+levelSd, length=0.05, angle=90, code=3)

dev.off()


# FIRST DIFFERENCE
# Create standardized dataframe
gap <- c("AsstToStore", "StoreToDist", "DistToReg", "RegToTop")
firstDiffStd <- data.frame(matrix(nrow = nrow(levelStd)-1, ncol = ncol(noZoneNoAreaTrans)), row.names = gap)

for (i in 1:ncol(noZoneNoAreaTrans)){
  diff <- diff(levelStd[,i])
  firstDiffStd[,i] <- diff
}
colnames(firstDiffStd) <- code

# Calculate mean and sd
firstDiffAvg = rowMeans(firstDiffStd)
firstDiffSd = apply(firstDiffStd[,1:ncol(noZoneNoAreaTrans)],1,sd)
firstDiffStd <- cbind(firstDiffStd, firstDiffAvg, firstDiffSd)

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/noZoneNoArea/firstDiffStd.jpeg")
jpeg(file=mypath)

x2 <- 1:(nrow(firstDiffStd))
plot(x2, firstDiffAvg,
     ylim=range(c(firstDiffAvg-firstDiffSd, firstDiffAvg+firstDiffSd)),
     pch=19, xlab="Positions", ylab="Mean +/- SD",
     main="Standardized First Difference"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x1, firstDiffAvg-firstDiffSd, x1, firstDiffAvg+firstDiffSd, length=0.05, angle=90, code=3)

dev.off()

# SECOND DIFFERENCE
# Create dataframe
gap <- c("AsstToStoreVSStoreToDist", "StoreToDistVSDistToReg", "DistToRegVSRegToTop")
secondDiffStd <- data.frame(matrix(nrow = nrow(firstDiffStd) - 1, ncol = ncol(noZoneNoAreaTrans)), row.names = gap)

for (i in 1:ncol(noZoneNoAreaTrans)){
  diff <- diff(diff(levelStd[,i]))
  secondDiffStd[,i] <- diff
}
colnames(secondDiffStd) <- code

# Calculate mean and sd
secondDiffAvg = rowMeans(secondDiffStd)
secondDiffSd = apply(secondDiffStd[,1:14],1,sd)
secondDiffStd <- cbind(secondDiffStd, secondDiffAvg, secondDiffSd)

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/noZoneNoArea/secondDiffStd.jpeg")
jpeg(file=mypath)

x3 <- 1:nrow(secondDiffStd)
plot(x3, secondDiffAvg,
     ylim=range(c(secondDiffAvg-secondDiffSd, secondDiffAvg+secondDiffSd)),
     pch=19, xlab="Positions", ylab="Mean +/- SD",
     main="Standardized Second Difference"
)
# hack: we draw arrows but with very special "arrowheads"
arrows(x3, secondDiffAvg-secondDiffSd, x3, secondDiffAvg+secondDiffSd, length=0.05, angle=90, code=3)

dev.off()



