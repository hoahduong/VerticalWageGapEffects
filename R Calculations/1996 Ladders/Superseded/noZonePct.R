setwd("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders")

noZone <- read.csv("noZone.csv")

# TRANSPOSE
# first remember the names
code <- noZone$code

# transpose all but the first column (name)
noZoneTrans <- as.data.frame(t(noZone[,-1]))
colnames(noZoneTrans) <- code

# LEVEL
# Create dataframe
position <- row.names(noZoneTrans)
levelPct <- data.frame(matrix(nrow = nrow(noZoneTrans), ncol = ncol(noZoneTrans)), row.names = position)

for (i in 1:ncol(noZoneTrans)){
  levelPct[1,i] <- 100
  for (j in 2:nrow(noZoneTrans)){
    pct <- noZoneTrans[j,i]/noZoneTrans[j-1,i] * 100
    levelPct[j,i] <- pct
  }
}
colnames(levelPct) <- code

# Calculate mean and sd
levelAvg = rowMeans(levelStd)
levelSd = apply(levelStd[,1:ncol(levelStd)],1,sd)
level <- cbind(levelStd, levelAvg, levelSd)

# Plot
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/NoZone/levelStd.jpeg")
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
