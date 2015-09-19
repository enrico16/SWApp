library(shiny)
library(DT)
library(RMySQL)

con <- dbConnect(MySQL(), user="ef884766", host="localhost", dbname="swapp")

shinyServer(function(input, output) {
				
				# STOPGAP Gene MeSH
				sqlOutput1 <- reactive({
					
					sqlCode <- paste0("select Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID from swappgenemesh",
									  " where PValue < ", input$pvalue,
									  " and GeneRank >= ", input$generank[1], " and GeneRank <= ", input$generank[2],
									  " and GeneScore >= ", input$genescore[1], " and GeneScore <= ", input$genescore[2],
									  ";")
					dbGetQuery(con, sqlCode)

				})
				
				output$table1 <- DT::renderDataTable(sqlOutput1(), server=TRUE, rownames=TRUE, filter="top", options=list(pageLength=10))
				
				output$download1 <- downloadHandler("SWApp.csv", content = function(file) {
										   rows <- input$table1_rows_all
										   write.csv(sqlOutput1()[rows, ], file, quote=FALSE, col.names=TRUE, row.names=FALSE)
				})

				# STOPGAP Best LD
				sqlOutput2 <- reactive({
					
					sqlCode <- paste0("select Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID from swappbestld",
									  " where PValue < ", input$pvalue,
									  " and GeneRank >= ", input$generank[1], " and GeneRank <= ", input$generank[2],
									  " and GeneScore >= ", input$genescore[1], " and GeneScore <= ", input$genescore[2],
									  ";")
					dbGetQuery(con, sqlCode)

				})
				
				output$table2 <- DT::renderDataTable(sqlOutput2(), server=TRUE, rownames=TRUE, filter="top", options=list(pageLength=10))
				
				output$download2 <- downloadHandler("SWApp.csv", content = function(file) {
										   rows <- input$table2_rows_all
										   write.csv(sqlOutput2()[rows, ], file, quote=FALSE, col.names=TRUE, row.names=FALSE)
				})
				

				# STOPGAP
				sqlOutput3 <- reactive({
					
					sqlCode <- paste0("select Gene, SNP, Trait, PValue, GeneScore, GeneRank, PubMedID from swapp",
									  " where PValue < ", input$pvalue,
									  " and GeneRank >= ", input$generank[1], " and GeneRank <= ", input$generank[2],
									  " and GeneScore >= ", input$genescore[1], " and GeneScore <= ", input$genescore[2],
									  ";")
					dbGetQuery(con, sqlCode)

				})
				
				output$table3 <- DT::renderDataTable(sqlOutput3(), server=TRUE, rownames=TRUE, filter="top", options=list(pageLength=10))
				
				output$download3 <- downloadHandler("SWApp.csv", content = function(file) {
										   rows <- input$table3_rows_all
										   write.csv(sqlOutput3()[rows, ], file, quote=FALSE, col.names=TRUE, row.names=FALSE)
				})
				

})
