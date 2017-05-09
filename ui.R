library(shiny)
library(DT)

shinyUI(
  fluidPage(
	titlePanel(title="", windowTitle="SWApp"),
	
	sidebarLayout(
		sidebarPanel(width=3,

					 h1(strong("SWApp")),

					 h3(strong("STOPGAP Web App")),
					 
					 p(strong("SWApp"), "is a simple web application for querying", strong("STOPGAP.")),
					 
			br(),
			
			selectInput("pvalue",
						"pvalue:",
						choices = list(1e-100,
									   1e-50,
									   1e-30,
									   1e-20,
									   1e-10,
									   1e-8,
									   1e-5,
                                       1e-4),
						selected=1e-8),
			
			sliderInput("gene.score",
						"gene_score:",
						min = 0,
						max = 12,
						value = c(0, 12)),
			
			sliderInput("gene.rank.min",
						"gene_rank_min:",
						min = 1,
						max = 100,
						value = c(1, 10)),
			
			br(),

            h4(strong("Info:")),

            tags$ul(
                    tags$li("SWApp uses version 2.5.1 of the STOPGAP data."),

                    tags$li("Please refer to our",
                            a("Bioinformatics paper", href="https://doi.org/10.1093/bioinformatics/btx274"),
                            "for details about the resource and to the",
                            a("STOPGAP README", href="https://github.com/StatGenPRD/STOPGAP/blob/master/README.md"),
                            "for information on the datasets, column names and evidence types."),

                    tags$li("STOPGAP is developed by Judong Shen, Kijoung Song, Andrew Slater, Enrico Ferrero and Matt Nelson.",
                            "Source code and issue tracker are available on",
                            a("GitHub.", href="https://github.com/StatGenPRD/STOPGAP")),

                    tags$li("SWApp is developed by Enrico Ferrero using",
                            a("Shiny.", href="http://shiny.rstudio.com/"),
                            "Source code and issue tracker are available on",
                            a("GitHub.", href="https://github.com/enricoferrero/SWApp"))
		)
            ),
		
		mainPanel(

				  tabsetPanel(

							  tabPanel("stopgap.gene.mesh",
									   DT::dataTableOutput("table1"),
									   downloadButton("download1", "Download")),

							  tabPanel("stopgap.bestld",
									   DT::dataTableOutput("table2"),
									   downloadButton("download2", "Download"))

							  )
				  )
		)
	))
