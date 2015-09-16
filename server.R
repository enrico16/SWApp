library(shiny)
library(DT)
library(RMySQL)

con <- dbConnect(MySQL(), user="ef884766", host="localhost", dbname="swapp")

shinyServer(function(input, output) {
                
                # bestld
                sqlOutput1 <- reactive({
                    
                    sqlCode <- paste0("select Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID from swapp.bestld",
                                      " where PValue < ", input$pvalue,
                                      " and GeneRank >= ", input$generank[1], " and GeneRank <= ", input$generank[2],
                                      " and GeneScore >= ", input$genescore[1], " and GeneScore <= ", input$genescore[2],
                                      ";")
                    dbGetQuery(con, sqlCode)

                })
                
                output$table1 <- DT::renderDataTable(sqlOutput1(), server=TRUE, rownames=TRUE, filter="top", options=list(pageLength=10))
                
                output$download1 <- downloadHandler("SWApp.txt", content = function(file) {
                                           rows <- input$table1_rows_all
                                           write.table(sqlOutput1()[rows, ], file, sep="\t", quote=FALSE, col.names=TRUE, row.names=FALSE)
                })
                
                # gene.mesh
                sqlOutput2 <- reactive({
                    
                    sqlCode <- paste0("select Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID from swapp.gene_mesh",
                                      " where PValue < ", input$pvalue,
                                      " and GeneRank >= ", input$generank[1], " and GeneRank <= ", input$generank[2],
                                      " and GeneScore >= ", input$genescore[1], " and GeneScore <= ", input$genescore[2],
                                      ";")
                    dbGetQuery(con, sqlCode)

                })
                
                output$table2 <- DT::renderDataTable(sqlOutput2(), server=TRUE, rownames=TRUE, filter="top", options=list(pageLength=10))
                
                output$download2 <- downloadHandler("SWApp.txt", content = function(file) {
                                           rows <- input$table2_rows_all
                                           write.table(sqlOutput2()[rows, ], file, sep="\t", quote=FALSE, col.names=TRUE, row.names=FALSE)
                })

})
