library(dplyr)

stopgap <- readRDS("data/stopgap.rds")

pvalue <- 1e-4
genescore <- 3
generank <- 5

stopgap <- stopgap %>%
	select(gene, msh, snp.ld, pvalue, gene.score, gene.rank.min, pubmedid) %>%
	rename(Gene=gene, Trait=msh, SNP=snp.ld, Pvalue=pvalue, GeneScore=gene.score, GeneRank=gene.rank.min, PubMedID=pubmedid) %>%
	filter(Pvalue < pvalue, GeneScore >= genescore, GeneRank <= generank) %>%
	group_by(Gene, SNP, PubMedID) %>%
	summarise(Pvalue=median(Pvalue), GeneScore=median(GeneScore), GeneRank=median(GeneRank)) %>%
	unique

saveRDS(stopgap, "data/smallgap.rds")
