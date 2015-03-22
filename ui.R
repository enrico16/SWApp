library(shiny)
library(dplyr)

stopgap <- read.delim("../../data/smallgap.txt") %>%
	select(gene, msh, snp.ld, pvalue, gene.score, gene.rank.min, pubmedid) %>%
	rename(Gene=gene, Trait=msh, SNP=snp.ld, Pvalue=pvalue, GeneScore=gene.score, GeneRank=gene.rank.min, PubMedID=pubmedid) %>%
	unique

shinyUI(
  fluidPage(
    titlePanel("Swapp: STOPGAP Web App"),
          
    fluidRow(
      column(4, 
          selectInput("gene", 
                      "Gene:", 
                      c("All", 
                        unique(as.character(stopgap$Gene))))
      ),
      column(4, 
          selectInput("trait", 
                      "Trait:", 
                      c("All", 
                        unique(as.character(stopgap$Trait))))
      ),
      column(4, 
          selectInput("snp", 
                      "SNP:", 
                      c("All", 
                        unique(as.character(stopgap$SNP))))
      )        
    ),
    fluidRow(
      dataTableOutput(outputId="table")
    )    
  )  
)
