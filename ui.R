library(shiny)
library(DT)

shinyUI(
  fluidPage(
	titlePanel(title="", windowTitle="SWApp"),
	
	sidebarLayout(
		sidebarPanel(width=3,

					 h1(strong("SWApp")),

					 h3(strong("STOPGAP Web App")),
					 
					 p(strong("SWApp"), "is a simple web application that makes using and querying", strong("STOPGAP"), "easier."),
					 
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
						value = c(5, 12)),
			
			sliderInput("gene.rank.min",
						"gene_rank_min:",
						min = 1,
						max = 100,
						value = c(1, 10)),
			
			br(),

            h4(strong("Info:")),

            tags$ul(
                    tags$li("SWApp uses version 2.5.1 of the STOPGAP data."),

                    tags$li("Please refer to the STOPGAP",
                            a(strong("README"), href="https://github.com/StatGenPRD/STOPGAP/blob/master/README.md"),
                            "on GitHub for information on the datasets, column names and evidence types."),


                    tags$li("STOPGAP is developed by",
                            a(strong("Judong Shen,"), href="mailto:judong.shen@merck.com"),
                            a(strong("Kijoung Song,"), href="mailto:kijoung.2.song@gsk.com"),
                            a(strong("Andrew Slater,"), href="mailto:AndrewSlater1@outlook.com"),
                            a(strong("Enrico Ferrero,"), href="mailto:enrico.x.ferrero@gsk.com"),
                            "and",
                            a(strong("Matt Nelson."), href="mailto:matthew.r.nelson@gsk.com"),
                            "Source code is available on",
                            a(strong("GitHub."), href="https://github.com/StatGenPRD")),

                    tags$li("SWApp is developed by",
                            a(strong("Enrico Ferrero"), href="mailto:enrico.x.ferrero@gsk.com"),
                            "using",
                            a(strong("Shiny."), href="http://shiny.rstudio.com/"),
                            "Source code is available on",
                            a(strong("GitHub."), href="https://github.com/enricoferrero/SWApp"))
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
#									   downloadButton("download2", "Download")),
#
#							  tabPanel("stopgap",
#									   DT::dataTableOutput("table3"),
#									   downloadButton("download3", "Download"))

							  )
				  )
		)
	))
