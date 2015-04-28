library(dplyr)

stopgap <- readRDS("data/stopgap.rds")

pvalue <- 1e-6
genescore <- 6
generank <- 1

smallgap <- stopgap %>%
	select(gene, msh, snp.ld, pvalue, gene.score, gene.rank.min, pubmedid) %>%
	rename(Gene=gene, Trait=msh, SNP=snp.ld, Pvalue=pvalue, GeneScore=gene.score, GeneRank=gene.rank.min, PubMedID=pubmedid) %>%
	filter(Pvalue < pvalue, GeneScore >= genescore, GeneRank <= generank) %>%
	group_by(Gene, SNP, Trait, PubMedID) %>%
	summarise(Pvalue=median(Pvalue), GeneScore=median(GeneScore), GeneRank=median(GeneRank)) %>%
	select(Gene, SNP, Trait, Pvalue, GeneScore, GeneRank, PubMedID) %>%
	distinct

saveRDS(smallgap, "data/smallgap.rds")
