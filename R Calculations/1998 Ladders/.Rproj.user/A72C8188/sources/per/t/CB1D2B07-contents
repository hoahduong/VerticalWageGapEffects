setwd("~/Desktop/18-19 Thesis/R Calculations/1998 Ladders")
rm(list=ls())

noZone <- read.csv("noZone.csv")
noZoneNoArea <- read.csv("noZoneNoArea.csv")

# Asst Store is reported by hourly wage -> multiply 2080
noZone$AsstStoreMgr <- noZone$AsstStoreMgr*2080
noZoneNoArea$AsstStoreMgr <- noZoneNoArea$AsstStoreMgr*2080

#----------------------------------#
# CREATE DATAFRAME
#----------------------------------#

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

#----------------------------------#
# FIND BETAS FOR EACH COMPANY
#----------------------------------#

# No Zone -------------------------#
noZone$Betas <- NA
for (i in 1:nrow(noZone)){
  x <- c(levelNZ$Position[i], levelNZ$Position[i + nrow(noZone)], 
         levelNZ$Position[i + 2*nrow(noZone)], 
         levelNZ$Position[i + 3*nrow(noZone)], 
         levelNZ$Position[i + 4*nrow(noZone)], 
         levelNZ$Position[i + 5*nrow(noZone)]
  )
  y = c(levelNZ$Level[i], levelNZ$Level[i + nrow(noZone)], 
        levelNZ$Level[i + 2*nrow(noZone)], 
        levelNZ$Level[i + 3*nrow(noZone)], 
        levelNZ$Level[i + 4*nrow(noZone)], 
        levelNZ$Level[i + 5*nrow(noZone)])
  curModel <- lm(y ~ poly(x,2))
  noZone$Betas[i] <- coefficients(curModel)[3]
}

# No Zone No Area -------------------------#
noZoneNoArea$Betas <- NA
for (i in 1:nrow(noZoneNoArea)){
  x <- c(levelNZNA$Position[i], levelNZNA$Position[i + nrow(noZoneNoArea)], 
         levelNZNA$Position[i + 2*nrow(noZoneNoArea)], 
         levelNZNA$Position[i + 3*nrow(noZoneNoArea)], 
         levelNZNA$Position[i + 4*nrow(noZoneNoArea)])
  y = c(levelNZNA$Level[i], levelNZNA$Level[i + nrow(noZoneNoArea)], 
        levelNZNA$Level[i + 2*nrow(noZoneNoArea)], 
        levelNZNA$Level[i + 3*nrow(noZoneNoArea)], 
        levelNZNA$Level[i + 4*nrow(noZoneNoArea)])
  curModel <- lm(y ~ poly(x,2))
  noZoneNoArea$Betas[i] <- coefficients(curModel)[3]
}

#----------------------------------#
# REGRESSION
#----------------------------------#

summary(lm(noZone$volume / 1000 ~ noZone$Betas))
summary(lm(noZone$volume ~ noZone$Betas + noZone$stores))
summary(lm(noZone$volume / 1000 ~ noZone$Betas + noZone$stores + noZone$employees))

summary(lm(noZoneNoArea$volume / 1000 ~ noZoneNoArea$Betas))
summary(lm(noZoneNoArea$volume ~ noZoneNoArea$Betas + noZoneNoArea$stores))
summary(lm(noZoneNoArea$volume / 1000 ~ noZoneNoArea$Betas + noZoneNoArea$stores + noZoneNoArea$employees))

#----------------------------------#
# CONTROL FOR X-ERROR
#----------------------------------#

library(deming)
demingNZ = deming(noZone$volume /1000 ~ noZone$Betas)
demingNZNA = deming(noZoneNoArea$volume /1000 ~ noZoneNoArea$Betas)

demingNZ
demingNZNA