###
###

.pkgname <- "Bsatelier.Bom"

.seqnames <- c('chr1', 'chr2', 'chr3', 'chr4', 'chr5', 'chr6', 'chr7', 'chr8', 'chr9', 'chr10', 'chr11', 'chr12')

.circ_seqs <- NULL

.mseqnames <- NULL

.onLoad <- function(libname, pkgname)
{
    if (pkgname != .pkgname)
        stop("package name (", pkgname, ") is not ",
             "the expected name (", .pkgname, ")")
    extdata_dirpath <- system.file("extdata", package=pkgname,
                                   lib.loc=libname, mustWork=TRUE)

    ## Make and export BSgenome object.
    bsgenome <- BSgenome(
        organism="Cicer arietinum",
        common_name="Rice",
        provider="NCBI",
        provider_version="ASM33114v1",
        release_date="Jan. 2013",
        release_name="BGI-Shenzhen ASM33114v1",
        source_url="ftp://ftp.ensemblgenomes.org/pub/release-46/plants/fasta/oryza_sativa/dna/",
        seqnames=.seqnames,
        circ_seqs=.circ_seqs,
        mseqnames=.mseqnames,
        seqs_pkgname=pkgname,
        seqs_dirpath=extdata_dirpath
    )

    ns <- asNamespace(pkgname)

    objname <- pkgname
    assign(objname, bsgenome, envir=ns)
    namespaceExport(ns, objname)

    old_objname <- "Bom"
    assign(old_objname, bsgenome, envir=ns)
    namespaceExport(ns, old_objname)
}

