# BSgenome.oryza



# Intrduction
An infrastructure package Bsgenome is available for acccesing,analyzing,creating or modifying Biostrings-based genome data package.And the main goal of this document is to explain the steps in building the Bsgenome rice package.

# Step1: Install the BSgenome package

```{r eval=FALSE}
if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("BSgenome", version = "3.8")
```

# Step2: Download the genome sequence

Download the fasta files for the desired genome sequence.In our case the oryza_sativa had 12 Chromosones downloaded separately.
Those fasta files were found in this [repository](ftp://ftp.ensemblgenomes.org/pub/release-46/plants/fasta/oryza_sativa/dna/).

# Step3: Prepared my files

I created a new folder on my Desktop and set this as my working directory:

```{r eval=FALSE}
setwd("/Users/asus/Desktop/Atelier1/Bsatelier")
```
* Create my seqs_srcdir file :
  + In this file i put all the Downloaded fasta files and named them starting with Chr so it can be more readable.
* Create my Seed file
  + The seed file contains all the relevant metadata for the BSgenome package

```{r eval=FALSE}
Package: BSgenome.oryza
Title: Full genome sequence for Vibrio cholerae O1 biovar El Tor str N16961
Description: Oryza sativa full genome as provided by MSU (MSU7 Genome Release) and stored in Biostrings objects.
Version: 1.0.0
Author: Oumaima lahiani
organism: Oryza sativa
common_name: Rice
provider: MSU
provider_version: MSU7
release_date: 2020/05
release_name: MSU7 Genome Release
source_url: ftp://ftp.ensemblgenomes.org/pub/release-46/plants/fasta/oryza_sativa/dna/
organism_biocview: oryza
BSgenomeObjname: oryza
seqfiles_suffix: .fa
seqs_srcdir:/Users/asus/Desktop/Atelier1/Bsatelier/inst/extdata
seqnames: c('chr1', 'chr2', 'chr3', 'chr4', 'chr5', 'chr6', 'chr7', 'chr8', 'chr9', 'chr10', 'chr11', 'chr12')
```

* The two important notes that crossed my path were:
  + The BSgenomeObjname is important because this is the name you will use to access the package in R once it has been installed.

  + For genomes with multiple chromosomes, list them as a vector.

# step4: Forge the package
* The package is forged using the forgeBSgenomeDataPkg function.

* Simply use the name of the seed file as the only argument and it will create your package files to the same directory.

```{r eval=FALSE}
forgeBSgenomeDataPkg("/Users/asus/Desktop/Atelier1/Bsatelier/DESCRIPTION")
```

Note:
To run the function again, delete the previous package files first.


# step5: Installing my genome package

To install the genome package you will need to use the Mac command line (Terminal).
1. Close R
2. Open Terminal
3. In the Terminal i needed to navigate to my working directory:(using cd)
4. 
```{r eval=FALSE}
Run R CMD build BSgenome.oryza to compile the package
Run R CMD check BSgenome.oryza.tar.gz to check it
Run R CMD INSTALL BSgenome.oryza_1.0.0.tar.gz
```

# step6: Loading and accessing the genome in R
To use the genome in R you will need to load the package using the library() function.

```{r eval=FALSE}
library(BSgenome.oryza)
```

# Documentation
* [How to forge a BSgenome data package](https://www.bioconductor.org/packages/release/bioc/vignettes/BSgenome/inst/doc/BSgenomeForge.pdf)
* [BSgenome.Osativa.MSU.MSU7
](https://bioconductor.org/packages/release/data/annotation/manuals/BSgenome.Osativa.MSU.MSU7/man/BSgenome.Osativa.MSU.MSU7.pdf)
* [build_custom_BSgenome_TxDb](https://github.com/mevers/build_custom_BSgenome_TxDb/blob/master/BSgenome_seed.dcf)
