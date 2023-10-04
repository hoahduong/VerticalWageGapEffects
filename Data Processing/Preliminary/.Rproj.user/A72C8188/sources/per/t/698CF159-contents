CEO = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/01 CEO.txt", header = TRUE, sep = "\t", dec = ",")
meanCEO = mean(CEO$Total, na.rm = TRUE)
CFO = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/07 CFO.txt", header = TRUE, sep = "\t", dec = ",")
View(CFO)
meanCFO = mean(CFO$Total, na.rm = TRUE)
topStoreOps = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/37 Top Store Operations.txt", header = TRUE, sep = "\t", dec = ",")
meanTopStore = mean(topStoreOps$Total, na.rm = TRUE)
zoneMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/38 Zone Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanZoneMan = mean(zoneMan$Total, na.rm = TRUE)
regionalMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/39 Regional Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanRegionalMan = mean(regionalMan$Total, na.rm = TRUE)
distMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/40 District Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanDistMan = mean(distMan$Total, na.rm = TRUE)
areaMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/41 Area Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanAreaMan = mean(areaMan$Total, na.rm = TRUE)
storeMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/42 Store Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanStoreMan = mean(storeMan$Total, na.rm = TRUE)
asStoreMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1996/43 Assistant Store Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanAsStoreMan = mean(asStoreMan$Total, na.rm = TRUE)
gap7 = meanCEO - meanTopStore
gap6 = meanTopStore - meanZoneMan
gap5 = meanZoneMan - meanRegionalMan
gap4 = meanRegionalMan - meanDistMan
gap3 = meanDistMan - meanAreaMan
gap2 = meanAreaMan - meanStoreMan
gap1 = meanStoreMan - meanAsStoreMan
gaps <- c(gap1, gap2, gap3, gap4, gap6, gap7)
plot(gaps)
gapsNoCEO <- c(gap1, gap2, gap3, gap4, gap5, gap6)
plot(gapsNoCEO, main = "Pay Gap and Organizational Level (1996)", xlab = "Organizational Gap")
means <- c(meanAsStoreMan, meanStoreMan, meanAreaMan, meanDistMan, meanRegionalMan, meanZoneMan, meanTopStore)
plot(means, main = "Pay Level and Organizational Level (1996)", xlab = "Organizational Level", ylab = "Pay Level ($)")
means
gapsNoCEO
