library(DESeq2)
# Description of samples
dds <- readRDS("DESeqDataSet.rds")
colData(dds)

## We've set up a default design - you'll presumably want to change this
## to address the question of interest
design(dds)  <-  ~ 1
design(dds)

## correct the design above, and specify contrasts that address
## questions the scientist might be interest in. Then

dds <- DESeq(dds) # fit the model

res <- results(dds) # set either the 'contrast' or 'name' argument to find the differential genes of interest



