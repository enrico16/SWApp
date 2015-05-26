library(dplyr)

# read data
stopgap <- readRDS("data/stopgap.rds")

# process data
swapp <- stopgap %>%
	select(gene, msh, snp.ld, pvalue, gene.score, gene.rank.min, pubmedid) %>%
	rename(Gene=gene, Trait=msh, SNP=snp.ld, PValue=pvalue, GeneScore=gene.score, GeneRank=gene.rank.min, PubMedID=pubmedid) %>%
	group_by(Gene, SNP, Trait, PubMedID) %>%
	summarise(PValue=median(PValue), GeneScore=median(GeneScore), GeneRank=median(GeneRank)) %>%
	select(Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID) %>%
	distinct

# write to file
write.table(swapp, "data/swapp.txt", sep="\t", quote=FALSE, row.names=FALSE, col.names=FALSE)
