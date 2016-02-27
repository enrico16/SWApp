library(dplyr)

## read data
#stopgap <- read.delim("data/stopgap.txt", na.strings=c(NA, ""))
stopgap.bestld <- read.delim("data/stopgap.bestld.txt", na.strings=c(NA, ""))
stopgap.gene.mesh <- read.delim("data/stopgap.gene.mesh.txt", na.strings=c(NA, ""))

## process data
## STOPGAP
#swapp <- stopgap %>%
#	select(gene, snp.gwas, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid) %>%
#	group_by(gene, snp.gwas, snp.ld, msh, gene.best, evidence, evidence.best, pubmedid) %>%
#	summarise(pvalue=median(pvalue) * 1.0, gene.score=median(gene.score) * 1.0, gene.rank.min=median(gene.rank.min) * 1.0) %>%
#	select(gene, snp.gwas, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid) %>%
#	distinct

# STOPGAP Best LD
swapp.bestld <- stopgap.bestld %>%
	select(gene, snp.gwas, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid) %>%
	group_by(gene, snp.gwas, snp.ld, msh, gene.best, evidence, evidence.best, pubmedid) %>%
	summarise(pvalue=median(pvalue) * 1.0, gene.score=median(gene.score) * 1.0, gene.rank.min=median(gene.rank.min) * 1.0) %>%
	select(gene, snp.gwas, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid) %>%
	distinct

# STOPGAP Gene MeSH
swapp.gene.mesh <- stopgap.gene.mesh %>%
	select(gene, snp.gwas, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid) %>%
	group_by(gene, snp.gwas, snp.ld, msh, gene.best, evidence, evidence.best, pubmedid) %>%
	summarise(pvalue=median(pvalue) * 1.0, gene.score=median(gene.score) * 1.0, gene.rank.min=median(gene.rank.min) * 1.0) %>%
	select(gene, snp.gwas, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid) %>%
	distinct

## write to file
#write.table(swapp, "data/swapp.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
write.table(swapp.bestld, "data/swapp.bestld.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
write.table(swapp.gene.mesh, "data/swapp.gene.mesh.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=TRUE)
