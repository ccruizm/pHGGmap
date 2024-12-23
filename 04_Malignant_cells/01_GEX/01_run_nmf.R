.libPaths(c("/home/cruiz2/R/x86_64-pc-linux-gnu-library/4.0", .libPaths()))
libpath <- .libPaths()[1]
.libPaths() 

suppressPackageStartupMessages({
library(doParallel)
library(dplyr)
library(Seurat)
library(NMF)
})

args <- commandArgs(trailingOnly = TRUE)
sample_index <- as.integer(args[1])


message("Computing NMF for sample: ", sample_index)

# The following code is strongly suggested to be run in a cluster, for each sample individually as a job.

nmf_output_folder <- "/projects/0/einf2548/cruiz/dmg/notebooks/nmf/nmf_malignant" # Folder to store the results.

if (!file.exists(nmf_output_folder)) dir.create(nmf_output_folder)

sample.malignant <- readRDS('/projects/0/einf2548/cruiz/dmg/notebooks/nmf/data/malignant_for_nmf.rds')
sample.malignant

# Subset the malignant population pertaining to the sample.
malignant <- sample.malignant[, sample.malignant$sample == sample_index]
malignant <- malignant %>% FindVariableFeatures(nfeatures = 7000) 
malignant <- subset(malignant, features = VariableFeatures(malignant))

id <- unique(malignant$SampleID)

message("Processing sample ", id)

# Re-center the genes for this sample.
malignant <- Seurat::ScaleData(malignant, features = rownames(malignant))

# Extract the count matrix.
cts <- Seurat::GetAssayData(malignant, slot = 'scale.data')

# Set negative values to 0.
cts[cts < 0] <- 0

# Remove rows without expression in this sample.
cts <- cts[rowSums(cts) > 0, ]
dim(cts)

# Compute NMF for different K (i.e: signatures).
# From 2 to 10 NMF signatures.
k <- 2:10
nrun <- 10
seed <- 777 

# Run NMF.
message("Computing NMF for sample: ", id, ', with index: ', sample_index)

nmf <- NMF::nmf(x = cts,
                rank = k,
                nrun = nrun,
                seed = seed,
                method = "snmf/r",
                .options = "p16v")

# Save the results.
save(list = c("cts", "nmf"),
     file = paste0(nmf_output_folder, "/", id, "_rank2_10_nruns10.rdata"))