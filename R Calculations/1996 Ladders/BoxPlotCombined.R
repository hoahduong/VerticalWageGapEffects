setwd("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders")
rm(list=ls())

noZone <- read.csv("noZone.csv")
noZoneNoArea <- read.csv("noZoneNoArea.csv")

type <- c("Type 1", "Type 2")

# LEVEL

# Plot -------------------------#
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/Combined/Level.jpeg")
jpeg(file=mypath, width = 600, height = 600, units = "px", quality = 100)

#dev.new(width = 3, height = 2)

op <- par(mar = c(5.5,5.5,3.5,2) + 0.1)

# draw the plot but without annotation
draw <- boxplot(noZone$AsstStoreMgr, noZoneNoArea$AsstStoreMgr, 
        noZone$StoreMgr, noZoneNoArea$StoreMgr, 
        noZone$AreaMgr,
        noZone$DistrictMgr, noZoneNoArea$DistrictMgr,
        noZone$RegionalMgr, noZoneNoArea$RegionalMgr,
        noZone$TopStoreOps, noZoneNoArea$TopStoreOps,
        at = c(1,2, 4,5, 7, 9,10, 12,13, 15,16),
        col = c("blue", "red", "blue", "red", "blue",
                "blue", "red", "blue", "red", "blue", "red"), 
        main = "Pay Level (1996)", axes = FALSE, ann = FALSE)

# add axes and legend
legend("topleft", type, fill = c("blue", "red"))
axis(1, at = c(1.5, 4.5, 7, 9.5, 12.5, 15.5), 
     labels = c("Assistant \n Store Mgr",
                "Store Mgr", 
                "Area Mgr", 
                "District\n Mgr   ", 
                "Regional\n Mgr   ",
                "Head of \n Stores"), las = 2, cex.axis = 1)
axis(2, at = seq(0, 400000, by = 50000), las = 2, cex.axis = 1)

title(ylab = "Pay level ($)", line = 4.25, cex.lab = 1)
box()

par(op)

dev.off()

# FIRST DIFFERENCE

# Create dataframe -------------------------#
# No Zone
gap1NZ <- c("Code", "Stores", "Volume", "AsstToStore", "StoreToArea", "AreaToDist", "DistToReg", "RegToTop")
firstDiffNZ <- data.frame(matrix(nrow = nrow(noZone), ncol = ncol(noZone) - 1))
colnames(firstDiffNZ) <- gap1NZ

firstDiffNZ$Code <- noZone$code
firstDiffNZ$Stores <- noZone$stores
firstDiffNZ$Volume <- noZone$volume

firstDiffNZ$AsstToStore <- noZone$StoreMgr - noZone$AsstStoreMgr
firstDiffNZ$StoreToArea <- noZone$AreaMgr - noZone$StoreMgr
firstDiffNZ$AreaToDist <- noZone$DistrictMgr - noZone$AreaMgr
firstDiffNZ$DistToReg <- noZone$RegionalMgr - noZone$DistrictMgr
firstDiffNZ$RegToTop <- noZone$TopStoreOps - noZone$RegionalMgr

# No Zone No Area
gap1NZNA <- c("Code", "Stores", "Volume", "AsstToStore", "StoreToDist", "DistToReg", "RegToTop")
firstDiffNZNA <- data.frame(matrix(nrow = nrow(noZoneNoArea), ncol = ncol(noZoneNoArea) - 1))
colnames(firstDiffNZNA) <- gap1NZNA

firstDiffNZNA$Code <- noZoneNoArea$code
firstDiffNZNA$Stores <- noZoneNoArea$stores
firstDiffNZNA$Volume <- noZoneNoArea$volume

firstDiffNZNA$AsstToStore <- noZoneNoArea$StoreMgr - noZoneNoArea$AsstStoreMgr
firstDiffNZNA$StoreToDist <- noZoneNoArea$DistrictMgr - noZoneNoArea$StoreMgr
firstDiffNZNA$DistToReg <- noZoneNoArea$RegionalMgr - noZoneNoArea$DistrictMgr
firstDiffNZNA$RegToTop <- noZoneNoArea$TopStoreOps - noZoneNoArea$RegionalMgr

# Plot -------------------------#
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/Combined/First Difference.jpeg")
jpeg(file=mypath, width = 600, height = 600, units = "px", quality = 100)

#dev.new(width = 3, height = 2)

op <- par(mar = c(5,5.5,3.5,2) + 0.1)

# draw the plot but without annotation
boxplot(firstDiffNZ$AsstToStore, firstDiffNZNA$AsstToStore,
        firstDiffNZ$StoreToArea, 
        firstDiffNZNA$StoreToDist, firstDiffNZ$AreaToDist,
        firstDiffNZ$DistToReg, firstDiffNZNA$DistToReg,
        firstDiffNZ$RegToTop, firstDiffNZNA$RegToTop,
        at = c(1,2, 4,5,6, 8,9, 11,12),
        col = c("blue", "red", "blue", "red", "blue",
                "blue", "red", "blue", "red"), 
        main = "First Difference (1996)", axes = FALSE, ann = FALSE)

# add axes and legend
legend("topleft", type, fill = c("blue", "red"))
axis(1, at = c(1.5, 4,5,6, 8.5, 11.5), 
     labels = c("Assistant\n to Store",
                "Store to\n Area", 
                "Store to\n District", "Area to\n District",
                "District to\n Regional",
                "Regional\n to Head"), las = 2, cex.axis = 1)
axis(2, at = seq(0, 400000, by = 50000), las = 2, cex.axis = 1)

title(ylab = "Pay gap ($)", line = 4, cex.lab = 1)
box()

par(op)

dev.off()


# SECOND DIFFERENCE

# Create dataframe -------------------------#
# No Zone
gap2NZ <- c("Code", "Stores", "Volume", "AsstToStoreVSStoreToArea", "StoreToAreaVSAreaToDist", "AreaToDistVSDistToReg", "DistToRegVSRegToTop")
secondDiffNZ <- data.frame(matrix(nrow = nrow(noZone), ncol = ncol(noZone) - 2))
colnames(secondDiffNZ) <- gap2NZ

secondDiffNZ$Code <- noZone$code
secondDiffNZ$Stores <- noZone$stores
secondDiffNZ$Volume <- noZone$volume

secondDiffNZ$AsstToStoreVSStoreToArea <- firstDiffNZ$StoreToArea - firstDiffNZ$AsstToStore
secondDiffNZ$StoreToAreaVSAreaToDist <- firstDiffNZ$AreaToDist - firstDiffNZ$StoreToArea
secondDiffNZ$AreaToDistVSDistToReg <- firstDiffNZ$DistToReg - firstDiffNZ$AreaToDist
secondDiffNZ$DistToRegVSRegToTop <- firstDiffNZ$RegToTop - firstDiffNZ$DistToReg

# No Zone No Area
gap2NZNA <- c("Code", "Stores", "Volume", "AsstToStoreVSStoreToDist", "StoreToDistVSDistToReg", "DistToRegVSRegToTop")
secondDiffNZNA <- data.frame(matrix(nrow = nrow(noZoneNoArea), ncol = ncol(noZoneNoArea) - 2))
colnames(secondDiffNZNA) <- gap2NZNA

secondDiffNZNA$Code <- noZoneNoArea$code
secondDiffNZNA$Stores <- noZoneNoArea$stores
secondDiffNZNA$Volume <- noZoneNoArea$volume

secondDiffNZNA$AsstToStoreVSStoreToDist <- firstDiffNZNA$StoreToDist - firstDiffNZNA$AsstToStore
secondDiffNZNA$StoreToDistVSDistToReg <- firstDiffNZNA$DistToReg - firstDiffNZNA$StoreToDist
secondDiffNZNA$DistToRegVSRegToTop <- firstDiffNZNA$RegToTop - firstDiffNZNA$DistToReg

# Plot -------------------------#
mypath <- file.path("~/Desktop/18-19 Thesis/R Calculations/1996 Ladders/Plots/Combined/Second Difference.jpeg")
jpeg(file=mypath, width = 600, height = 600, units = "px", quality = 100)

#dev.new(width = 3, height = 2)

op <- par(mar = c(7.5,5.75,3.5,2) + 0.1)

# draw the plot but without annotation
boxplot(secondDiffNZ$AsstToStoreVSStoreToArea, 
        secondDiffNZNA$AsstToStoreVSStoreToDist, 
        secondDiffNZ$StoreToAreaVSAreaToDist,
        
        secondDiffNZ$AreaToDistVSDistToReg,
        secondDiffNZNA$StoreToDistVSDistToReg, 
        
        secondDiffNZ$DistToRegVSRegToTop, 
        secondDiffNZNA$DistToRegVSRegToTop,
        
        at = c(1,2,3, 5,6, 8,9),
        col = c("blue", "red", "blue", "blue", "red",
                "blue", "red"), 
        main = "Second Difference (1996)", axes = FALSE, ann = FALSE)

# add axes and legend
legend("topleft", type, fill = c("blue", "red"))
axis(1, at = c(1,2,3, 5,6, 8.5), 
     labels = c("Asst to Store \n vs. Store to Area",
                "Asst to Store \n vs. Store to Dist",
                "Store to Area \n vs. Area to Dist",
                
                "Area to Dist \n vs. Dist to Reg",
                "Store to Dist \n vs. Dist to Reg",
                
                "Dist to Reg \n vs. Reg to Head"), las = 2, cex.axis = 1)
axis(2, at = seq(-100000, 200000, by = 50000), las = 2, cex.axis = 1)

title(ylab = "Difference between pay gaps ($)", line = 3.95, cex.lab = 1)
box()

par(op)

dev.off()

#----------------------------------#
# T-TEST
#----------------------------------#

# No Zone
t.test(secondDiffNZ$AsstToStoreVSStoreToArea, alternative = "greater")
t.test(secondDiffNZ$StoreToAreaVSAreaToDist, alternative = "greater")
t.test(secondDiffNZ$AreaToDistVSDistToReg, alternative = "greater")
t.test(secondDiffNZ$DistToRegVSRegToTop, alternative = "greater")

# No Zone No Area
t.test(secondDiffNZNA$AsstToStoreVSStoreToDist, alternative = "greater")
t.test(secondDiffNZNA$StoreToDistVSDistToReg, alternative = "greater")
t.test(secondDiffNZNA$DistToRegVSRegToTop, alternative = "greater")

#----------------------------------#
# CORRELATION
#----------------------------------#

# No Zone
cor.test(secondDiffNZ$AsstToStoreVSStoreToArea, secondDiffNZ$Volume)
cor.test(secondDiffNZ$AsstToStoreVSStoreToArea, secondDiffNZ$Volume)
cor.test(secondDiffNZ$StoreToAreaVSAreaToDist, secondDiffNZ$Volume)
cor.test(secondDiffNZ$AreaToDistVSDistToReg, secondDiffNZ$Volume)
cor.test(secondDiffNZ$DistToRegVSRegToTop, secondDiffNZ$Volume)

# No Zone No Area
cor.test(secondDiffNZNA$AsstToStoreVSStoreToDist, secondDiffNZNA$Volume)
cor.test(secondDiffNZNA$StoreToDistVSDistToReg, secondDiffNZNA$Volume)
cor.test(secondDiffNZNA$DistToRegVSRegToTop, secondDiffNZNA$Volume)

#----------------------------------#
# REGRESSION
#----------------------------------#

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


#----------------------------------#
# REGRESSION ON AVERAGE
#----------------------------------#

# No Zone
avgNZ <- rowMeans(secondDiffNZ[,4:7])
secondDiffNZ <- cbind(secondDiffNZ, avgNZ)
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$avgNZ))
summary(lm(secondDiffNZ$Volume ~ secondDiffNZ$avgNZ + secondDiffNZ$Stores))

# No Zone No Area
avgNZNA <- rowMeans(secondDiffNZNA[,4:6])
secondDiffNZNA <- cbind(secondDiffNZNA, avgNZNA)
summary(lm(secondDiffNZNA$Volume ~ secondDiffNZNA$avgNZNA + secondDiffNZNA$Stores))


#----------------------------------#
# WRITE TO FILE
#----------------------------------#

write.csv(firstDiffNZ, file = "firstDiffNZ.csv")
write.csv(firstDiffNZNA, file = "firstDiffNZNA.csv")
write.csv(secondDiffNZ, file = "secondDiffNZ.csv")
write.csv(secondDiffNZNA, file = "secondDiffNZNA.csv")


#dotplot(noZone$AsstStoreMgr)





# # Create combined dataframe
# positions <- c("Type", colnames(noZone))
# combined <- data.frame(matrix(nrow = nrow(noZone) + nrow(noZoneNoArea), 
#                               ncol = ncol(noZone) + 1))
# colnames(combined) <- positions
# 
# for (i in 1:nrow(noZone)) {
#   currRow <- c(1, noZone[i,])
#   combined[i,] <- currRow
# }
# 
# for (i in 1:nrow(noZoneNoArea)) {
#   currRow <- c(2, noZoneNoArea[i,])
#   combined[i+nrow(noZone),] <- currRow
# }
# 
# code <- noZone$code
# 
# 
# boxplot(combined$AsstStoreMgr, combined$StoreMgr ~ combined$Type)



# for (i in 1:nrow(secondDiffNZ)){
#   for (j in 4:ncol(secondDiffNZ)){
#     if (secondDiffNZ[i,j] > 0){
#       secondDiffNZ[i,j] = 1
#     }
#     else {
#       secondDiffNZ[i,j] = 0
#     }
#   }
# }




