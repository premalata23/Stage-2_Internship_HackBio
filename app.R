# Load required libraries
library(shiny)
library(shinydashboard)
library(plotly)

# Define UI for the buffer calculation section
ui <- dashboardPage(
  dashboardHeader(title = "Buffer Calculation"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Buffer Preparation", tabName = "buffer_calc", icon = icon("flask"))
    )
  ),
  dashboardBody(
    fluidRow(
      box(
        title = "Buffer Calculation Inputs", status = "primary", solidHeader = TRUE,
        numericInput("pKa", "pKa of the buffer:", value = 4.75, min = 0.1, max = 14),
        numericInput("desired_pH", "Desired pH:", value = 7, min = 0.1, max = 14),
        numericInput("acid_conc", "Concentration of Acid (M):", value = 0.1, min = 0.001, max = 10),
        numericInput("base_conc", "Concentration of Base (M):", value = 0.1, min = 0.001, max = 10),
        numericInput("total_vol", "Total Volume of Buffer (mL):", value = 100, min = 1, max = 1000),
        actionButton("calculate", "Calculate")  # Add Calculate button
      )
    ),
    fluidRow(
      box(
        title = "Buffer Output", status = "primary", solidHeader = TRUE, width = 12,
        textOutput("buffer_result"),
        style = "font-size: 18px; padding: 20px; border: 2px solid #dcdcdc; background-color: #f7f7f7; color: #333;"
      )
    ),
    fluidRow(
      box(
        title = "Buffer Ratio Visualization", status = "primary", solidHeader = TRUE, width = 12,
        plotlyOutput("buffer_plot"),
        style = "padding: 20px; border: 2px solid #dcdcdc; background-color: #f7f7f7; color: #333;"
      )
    ),
    tags$style(HTML("
      .shiny-output-error {
        color: #cc0000;
        font-weight: bold;
        background-color: #ffeeee;
        padding: 10px;
        border-radius: 5px;
      }
      .shiny-output-error-validation {
        color: #cc0000;
        font-weight: bold;
      }
    "))
  )
)

# Define server logic for buffer calculation and interactive plot
server <- function(input, output) {
  
  observeEvent(input$calculate, {  # Trigger calculation when button is clicked
    
    # Validation: Ensure all input values are positive
    validate(
      need(input$pKa > 0, "Error: pKa must be positive."),
      need(input$desired_pH > 0, "Error: Desired pH must be positive."),
      need(input$acid_conc > 0, "Error: Acid concentration must be positive."),
      need(input$base_conc > 0, "Error: Base concentration must be positive."),
      need(input$total_vol > 0, "Error: Total volume must be positive.")
    )
    
    # Calculation Logic
    base_acid_ratio <- 10^(input$desired_pH - input$pKa)
    
    # Display the result in text
    output$buffer_result <- renderText({
      paste("To achieve a pH of", input$desired_pH, "with a buffer at pKa =", input$pKa, 
            ", the base to acid ratio should be", round(base_acid_ratio, 2),
            ". Total volume is", input$total_vol, "mL.")
    })
    
    # Render interactive plot using plotly
    output$buffer_plot <- renderPlotly({
      # Generate data for visualization
      pH_values <- seq(input$pKa - 2, input$pKa + 2, length.out = 100)
      base_acid_ratios <- 10^(pH_values - input$pKa)
      
      # Create plotly interactive plot
      plot_ly(x = ~pH_values, y = ~base_acid_ratios, type = 'scatter', mode = 'lines') %>%
        layout(
          title = list(text = "<b>Base to Acid Ratio vs pH</b>", font = list(size = 16)),
          xaxis = list(title = "pH"),
          yaxis = list(title = "Base to Acid Ratio"),
          hovermode = "closest"
        )
    })
    
  })
}

# Run the application
shinyApp(ui = ui, server = server)




   