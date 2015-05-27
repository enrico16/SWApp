library(shiny)
library(RMySQL)

con <- dbConnect(MySQL(), user="ef884766", host="localhost", dbname="stopgap")

shinyServer(function(input, output) {
  
  output$table <- renderDataTable({

    if (input$gene != "All") {
        sqlCode <- paste0("select * from swapp where PValue >=", input$pvalue[1], " and PValue <=", input$pvalue[2],
                        " and GeneRank >=", input$generank[1], " and GeneRank <=", input$generank[2],
                        " and GeneScore >=", input$genescore[1], " and GeneRank <=", input$genescore[2],
                        " and Gene =", input$gene, ";")
    }
    if (input$trait != "All") {
        sqlCode <- paste0("select * from swapp where PValue >=", input$pvalue[1], " and PValue <=", input$pvalue[2],
                        " and GeneRank >=", input$generank[1], " and GeneRank <=", input$generank[2],
                        " and GeneScore >=", input$genescore[1], " and GeneRank <=", input$genescore[2],
                        " and Trait =", input$trait, ";")
    }
    if (input$snp != "All") {
        sqlCode <- paste0("select * from swapp where PValue >=", input$pvalue[1], " and PValue <=", input$pvalue[2],
                        " and GeneRank >=", input$generank[1], " and GeneRank <=", input$generank[2],
                        " and GeneScore >=", input$genescore[1], " and GeneRank <=", input$genescore[2],
                        " and SNP =", input$snp, ";")
    } else {
        sqlCode <- paste0("select * from swapp where PValue >=", input$pvalue[1], " and PValue <=", input$pvalue[2],
                        " and GeneRank >=", input$generank[1], " and GeneRank <=", input$generank[2],
                        " and GeneScore >=", input$genescore[1], " and GeneRank <=", input$genescore[2], ";")
    }

    data <- dbGetQuery(con, sqlCode)

  },
  options = list(pageLength = 10))
})
