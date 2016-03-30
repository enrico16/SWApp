library(shiny)
library(DT)

shinyUI(
  fluidPage(
	titlePanel(title="", windowTitle="SWApp"),
	
	sidebarLayout(
		sidebarPanel(width=3,

					 h1(strong("SWApp 2.4")),

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
									   0.001,
									   0.01,
									   0.05),
						selected=0.05),
			
			sliderInput("gene.score",
						"gene_score:",
						min = 0,
						max = 20,
						value = c(0, 20)),
			
			sliderInput("gene.rank.min",
						"gene_rank_min:",
						min = 1,
						max = 100,
						value = c(1, 100)),
			
			br(),

            h4(strong("Info:")),

            tags$ul(
                    tags$li("SWApp 2.4 uses the STOPGAP 2.4 data."),

                    tags$li("Please refer to the",
                            a(strong("STOPGAP"), href="https://connect.gsk.com/sites/genetics/GeneticsWIKI/Wiki%20Pages/STOPGAP2.aspx"),
                            "wiki page for information on the datasets, column names and evidence types."),

                    tags$li("SWApp is developed by",
                            a(strong("Enrico Ferrero"), href="mailto:enrico.x.ferrero@gsk.com"),
                            "using",
                            a(strong("Shiny"), href="http://shiny.rstudio.com/"),
                            "on",
                            a(strong("GitHub."), href="https://github.com/enricoferrero/SWApp")),

                    tags$li("STOPGAP is developed by",
                            a(strong("Matt Nelson"), href="mailto:matthew.r.nelson@gsk.com"),
                            "and",
                            a(strong("Kijoung Song."), href="mailto:kijoung.2.song@gsk.com"))
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
