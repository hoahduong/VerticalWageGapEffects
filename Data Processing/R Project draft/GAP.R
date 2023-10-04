GAPStoreOps <- read.csv("/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/GAP/Superseded/GAPStoreOps.csv", header = TRUE)
plot(GAPStoreOps$payGap)

GAPBuying <- read.csv("/Users/macbook/Desktop/18-19 Thesis/Data Processing/1996/GAP/Superseded/GAPBuying.csv", header = TRUE)
plot(GAPBuying$payGap)

GAPCentralAdm <- read.csv("/Users/macbook/Desktop/18-19 Thesis/Data Processing/GAP/GAPCentralAdm.csv", header = TRUE)
plot(GAPCentralAdm$payGap)