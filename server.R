library(shiny)
library(DT)
library(RMySQL)

con <- dbConnect(MySQL(), user="ef884766", host="localhost", dbname="swapp")
toDisplay <- c("gene", "snp.ld", "msh", "pvalue", "gene.score", "gene.rank.min", "evidence", "gene.best", "evidence.best", "pubmedlink")
toDownload <- c("gene", "snp.ld", "msh", "pvalue", "gene.score", "gene.rank.min", "evidence", "gene.best", "evidence.best", "pubmedid")

shinyServer(function(input, output) {
				
				# STOPGAP gene MeSH
				sqlOutput1 <- reactive({
					
					sqlCode <- paste0("select gene, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid from swapp.gene.mesh",
									  " where pvalue < ", input$pvalue,
									  " and gene.rank.min >= ", input$gene.rank.min[1], " and gene.rank.min <= ", input$gene.rank.min[2],
									  " and gene.score >= ", input$gene.score[1], " and gene.score <= ", input$gene.score[2],
									  ";")
					sqlOutput <- dbGetQuery(con, sqlCode)
                    sqlOutput$pubmedlink <- paste0("<a href='http://www.ncbi.nlm.nih.gov/pubmed/", sqlOutput$pubmedid, "'>", sqlOutput$pubmedid, "</a>")
                    return(sqlOutput)

				})
				
				output$table1 <- DT::renderDataTable(sqlOutput1()[toDisplay], server=TRUE, rownames=TRUE, escape=FALSE, filter="top", options=list(pageLength=10))
				
				output$download1 <- downloadHandler("SWApp.csv", content = function(file) {
										   rows <- input$table1_rows_all
										   write.csv(sqlOutput1()[rows, toDownload], file, quote=TRUE, col.names=TRUE, row.names=FALSE)
				})

				# STOPGAP Best LD
				sqlOutput2 <- reactive({
					
					sqlCode <- paste0("select gene, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid from swapp.bestld",
									  " where pvalue < ", input$pvalue,
									  " and gene.rank.min >= ", input$gene.rank.min[1], " and gene.rank.min <= ", input$gene.rank.min[2],
									  " and gene.score >= ", input$gene.score[1], " and gene.score <= ", input$gene.score[2],
									  ";")
					sqlOutput <- dbGetQuery(con, sqlCode)
                    sqlOutput$pubmedlink <- paste0("<a href='http://www.ncbi.nlm.nih.gov/pubmed/", sqlOutput$pubmedid, "'>", sqlOutput$pubmedid, "</a>")
                    return(sqlOutput)

				})
				
				output$table2 <- DT::renderDataTable(sqlOutput2()[toDisplay], server=TRUE, rownames=TRUE, escape=FALSE, filter="top", options=list(pageLength=10))
				
				output$download2 <- downloadHandler("SWApp.csv", content = function(file) {
										   rows <- input$table2_rows_all
										   write.csv(sqlOutput2()[rows, toDownload], file, quote=TRUE, col.names=TRUE, row.names=FALSE)
				})
				

				# STOPGAP
				sqlOutput3 <- reactive({
					
					sqlCode <- paste0("select gene, snp.ld, msh, pvalue, gene.score, gene.rank.min, evidence, gene.best, evidence.best, pubmedid from swapp",
									  " where pvalue < ", input$pvalue,
									  " and gene.rank.min >= ", input$gene.rank.min[1], " and gene.rank.min <= ", input$gene.rank.min[2],
									  " and gene.score >= ", input$gene.score[1], " and gene.score <= ", input$gene.score[2],
									  ";")
					sqlOutput <- dbGetQuery(con, sqlCode)
                    sqlOutput$pubmedlink <- paste0("<a href='http://www.ncbi.nlm.nih.gov/pubmed/", sqlOutput$pubmedid, "'>", sqlOutput$pubmedid, "</a>")
                    return(sqlOutput)

				})
				
				output$table3 <- DT::renderDataTable(sqlOutput3()[toDisplay], server=TRUE, rownames=TRUE, escape=FALSE, filter="top", options=list(pageLength=10))
				
				output$download3 <- downloadHandler("SWApp.csv", content = function(file) {
										   rows <- input$table3_rows_all
										   write.csv(sqlOutput3()[rows, toDownload], file, quote=TRUE, col.names=TRUE, row.names=FALSE)
				})
				

})
