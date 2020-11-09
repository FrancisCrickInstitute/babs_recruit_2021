library(DESeq2)
# Description of samples
df <- expand.grid(cellline = LETTERS[1:7], treatment=c("Control","Treated"))
df$group <- ifelse(as.integer(df$cellline) <= 3, "Responder", "Non")

# Generate some null data

## If you're familiar with DESeq, then 
dds <- DESeqDataSetFromMatrix(
  countData = matrix(rpois(1000*nrow(df), lambda = 20), 1000, nrow(df)),
  colData=df,
  design = ~1 # obviously wrong!
)
## correct the design above, and specify contrasts that address
## questions the scientist might be interest in



## If you're not familiar with DESeq, then
df$y <- rpois(nrow(df), lambda=20)
## Fit a statistical of y. Models must be phrased in a way that
## they're full-rank, as DESeq rejects designs that aren't.




