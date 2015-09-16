library(dplyr)

## read data
#stopgap.bestld <- readRDS("data/stopgap.bestld.rds")
#stopgap.gene.mesh <- readRDS("data/stopgap.gene.mesh.rds")
stopgap.bestld <- read.delim("data/stopgap.bestld.txt", na.strings=c(NA, ""))
stopgap.gene.mesh <- read.delim("data/stopgap.gene.mesh.txt", na.strings=c(NA, ""))

## process data
# bestld
swapp.bestld <- stopgap.bestld %>%
	select(gene, msh, snp.ld, pvalue, gene.score, gene.rank.min, pubmedid) %>%
	rename(Gene=gene, Trait=msh, SNP=snp.ld, PValue=pvalue, GeneScore=gene.score, GeneRank=gene.rank.min, PubMedID=pubmedid) %>%
	group_by(Gene, SNP, Trait, PubMedID) %>%
	#summarise(PValue=median(PValue), GeneScore=median(GeneScore), GeneRank=median(GeneRank)) %>%
	summarise(PValue=median(PValue) * 1.0, GeneScore=median(GeneScore) * 1.0, GeneRank=median(GeneRank) * 1.0) %>%
	select(Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID) %>%
    na.omit %>%
	distinct
# gene.mesh
swapp.gene.mesh <- stopgap.gene.mesh %>%
	select(gene, msh, snp.ld, pvalue, gene.score, gene.rank.min, pubmedid) %>%
	rename(Gene=gene, Trait=msh, SNP=snp.ld, PValue=pvalue, GeneScore=gene.score, GeneRank=gene.rank.min, PubMedID=pubmedid) %>%
	group_by(Gene, SNP, Trait, PubMedID) %>%
	#summarise(PValue=median(PValue), GeneScore=median(GeneScore), GeneRank=median(GeneRank)) %>%
	summarise(PValue=median(PValue) * 1.0, GeneScore=median(GeneScore) * 1.0, GeneRank=median(GeneRank) * 1.0) %>%
	select(Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID) %>%
    na.omit %>%
	distinct

## write to file
write.table(swapp.bestld, "data/swapp.bestld.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
write.table(swapp.gene.mesh, "data/swapp.gene.mesh.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
