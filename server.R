library(shiny)
library(DT)
library(RMySQL)

con <- dbConnect(MySQL(), user="ef884766", host="localhost", dbname="stopgap")

shinyServer(function(input, output, session) {
  

    if (input$gene != "All") {
        sqlCode <- paste0("select * from swapp where PValue <=", input$pvalue,
                        " and GeneRank >=", input$generank[1], " and GeneRank <=", input$generank[2],
                        " and GeneScore >=", input$genescore[1], " and GeneRank <=", input$genescore[2],
                        " and Gene =", input$gene, ";")
    }
    if (input$trait != "All") {
        sqlCode <- paste0("select * from swapp where PValue <=", input$pvalue,
                        " and GeneRank >=", input$generank[1], " and GeneRank <=", input$generank[2],
                        " and GeneScore >=", input$genescore[1], " and GeneRank <=", input$genescore[2],
                        " and Trait =", input$trait, ";")
    }
    if (input$snp != "All") {
        sqlCode <- paste0("select * from swapp where PValue <=", input$pvalue,
                        " and GeneRank >=", input$generank[1], " and GeneRank <=", input$generank[2],
                        " and GeneScore >=", input$genescore[1], " and GeneRank <=", input$genescore[2],
                        " and SNP =", input$snp, ";")
    } else {
        sqlCode <- paste0("select * from swapp where PValue <=", input$pvalue,
                        " and GeneRank >=", input$generank[1], " and GeneRank <=", input$generank[2],
                        " and GeneScore >=", input$genescore[1], " and GeneRank <=", input$genescore[2], ";")
    }

    sqlRes <- dbGetQuery(con, sqlCode)

    action <- DT::dataTableAjax(session, sqlRes)
    widget <- DT::datatable(sqlRes,
                          server = TRUE,
                          options = list(
                                         ajax = list(url=action),
                                         pageLength = 10))
    
    output$table <- DT::renderDataTable(widget)
    
    output$download <- downloadHandler("SWApp.filtered.txt", content = function(file) {
                                         write.table(input$table_rows_all, file)
                          })
})
