library(shiny)

function(input, output) {
	output$contents <- renderTable
	({
		inFile <- input$file1
		if (is.null(inFile))
		return(NULL)
		
		read.csv(inFile$datapath, header=input$header, sep=input$sep,quote=input$quote)
	})

	data <- reactive
	({
		dist <- switch(input$dist,
				norm = rnorm,
				unif = runif,
				lnorm = rlnorm,
				exp = rexp,
				rnorm)

		dist(input$n)
	})

	output$plot <- renderPlot
	({
		dist <- input$dist
		n <- input$n
    
		hist(data(), 
			main=paste('r', dist, '(', n, ')', sep=''))
	})
  
  # Generate a summary of the data
 	output$summary <- renderPrint
	({
		summary(data())
	})
  
  # Generate an HTML table view of the data
	output$table <- renderTable
	({
		data.frame(x=data())
	})
  
}