CEO = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/01 CEO.txt", header = TRUE, sep = "\t", dec = ",")
meanCEO = mean(CEO$Total, na.rm = TRUE)
CFO = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/07 CFO.txt", header = TRUE, sep = "\t", dec = ",")
View(CFO)
meanCFO = mean(CFO$Total, na.rm = TRUE)
topStoreOps = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/37 Top Store Operations.txt", header = TRUE, sep = "\t", dec = ",")
meanTopStore = mean(topStoreOps$Total, na.rm = TRUE)
zoneMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/38 Zone Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanZoneMan = mean(zoneMan$Total, na.rm = TRUE)
regionalMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/39 Regional Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanRegionalMan = mean(regionalMan$Total, na.rm = TRUE)
distMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/40 District Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanDistMan = mean(distMan$Total, na.rm = TRUE)
areaMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/41 Area Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanAreaMan = mean(areaMan$Total, na.rm = TRUE)
storeMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/42 Store Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanStoreMan = mean(storeMan$Total, na.rm = TRUE)
asStoreMan = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/43 Assistant Store Manager.txt", header = TRUE, sep = "\t", dec = ",")
meanAsStoreMan = mean(asStoreMan$Total, na.rm = TRUE)
fullTime = read.delim2("/Users/macbook/Desktop/18-19 Thesis/fromBefore/theData/1997/45 Full Time.txt", header = TRUE, sep = "\t", dec = ",")
meanFullTime = mean(fullTime$Total, na.rm = TRUE)
gap1 = meanCEO - meanTopStore
gap2 = meanTopStore - meanZoneMan
gap3 = meanZoneMan - meanRegionalMan
gap4 = meanRegionalMan - meanDistMan
gap5 = meanDistMan - meanAreaMan
gap6 = meanAreaMan - meanStoreMan
gap7 = meanStoreMan - meanAsStoreMan
gaps <- c(gap7, gap6, gap5, gap4, gap3, gap2, gap1)
plot(gaps)
gapsNoCEO <- c(gap7, gap6, gap5, gap4, gap3, gap2)
plot(gapsNoCEO)