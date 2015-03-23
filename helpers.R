stopgap <- readRDS("data/stopgap.rds")

pvalue <- 1e-4
genescore <- 3
generank <- 5

stopgap <- stopgap %>%
	select(gene, msh, snp.ld, pvalue, gene.score, gene.rank.min, pubmedid) %>%
	rename(Gene=gene, Trait=msh, SNP=snp.ld, Pvalue=pvalue, GeneScore=gene.score, GeneRank=gene.rank.min, PubMedID=pubmedid) %>%
	filter(Pvalue < pvalue, GeneScore >= genescore, GeneRank <= generank) %>%
	unique

saveRDS(stopgap, "data/smallgap.rds")


