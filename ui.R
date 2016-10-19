library(shiny)
shinyUI(navbarPage(strong("Time_Series Forecasting Tool"),
	tabPanel("Data Summary",
	sidebarLayout(
		sidebarPanel(
			fileInput('file1', 'Choose CSV File',
				accept=c('text/csv','text/comma-separated-values,text/plain','.csv')),
      
				tags$hr(),
			checkboxInput('header', 'Header', TRUE),


			radioButtons("dist", "Distribution type:",
			c("Normal" = "norm",
				"Uniform" = "unif",
				"Log-normal" = "lnorm",
				"Exponential" = "exp")),
			br(),
      
      		sliderInput("year", 
				"Year:", 
				value = c(200,500),
				min = 1800, 
				max = 2016)
				),


		mainPanel(
			tabsetPanel(type = "tabs", 
				tabPanel("Plot", plotOutput("plot")), 
				tabPanel("Summary", verbatimTextOutput("summary")), 
				tabPanel("Table", tableOutput("table"))
			)
		)
	)
)
))