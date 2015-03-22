library(shiny)
library(dplyr)

stopgap <- read.delim("../../data/smallgap.txt") %>%
	select(gene, msh, snp.ld, pvalue, gene.score, gene.rank.min, pubmedid) %>%
	rename(Gene=gene, Trait=msh, SNP=snp.ld, Pvalue=pvalue, GeneScore=gene.score, GeneRank=gene.rank.min, PubMedID=pubmedid) %>%
	unique

shinyServer(function(input, output) {
  
  output$table <- renderDataTable({
    data <- stopgap
    if (input$man != "All"){
      data <- data[data$Gene == input$gene,]
    }
    if (input$cyl != "All"){
      data <- data[data$Trait == input$trait,]
    }
    if (input$trans != "All"){
      data <- data[data$SNP == input$snp,]
    }
    data
  })
  
})
