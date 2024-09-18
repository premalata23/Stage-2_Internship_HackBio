# Load required libraries
library(shiny)
library(shinydashboard)
library(plotly)
library(ggplot2)
library(shinyWidgets)
library(rsconnect)
library(shinyBS)
library(shinythemes)

# Define the UI for LabDASH
ui <- dashboardPage(
  dashboardHeader(
    title = tags$div(
      style = "font-family: 'Roboto', sans-serif; font-weight: 900; font-size: 24px; background-color: #323232; padding: 0 15px; display: flex; align-items: center; height: 50px;",
      tags$span("Lab", style = "color: white;"),
      tags$span("DASH", style = "color: #5c9dd8; margin-left: 2px;")
    ),
    titleWidth = 250
  ),
  
  dashboardSidebar(
    sidebarMenu(id = "sidebar",
                menuItem("Home", tabName = "home", icon = icon("home")),
                menuItem("Serial Dilution", tabName = "serial_dilution", icon = icon("flask")),
                menuItem("Stock Solution Dilution", tabName = "stock_dilution", icon = icon("vial")),
                menuItem("Buffer Preparation", tabName = "buffer_calc", icon = icon("balance-scale")),
                menuItem("CFU Calculator", tabName = "cfu", icon = icon("calculator")),
                menuItem("Cell Viability", tabName = "mtt", icon = icon("chart-bar"))
    )
  ),
  
  dashboardBody(
    tags$head(tags$style(HTML("
      .skin-blue .main-header .navbar {
        background-color: #323232; 
      }
      .skin-blue .main-header .logo {
        background-color: #323232!important; 
        padding-left: 10px;
        height: 50px; 
      }
      .skin-blue .main-header .logo span {
        font-family: 'Roboto', sans-serif;
        font-weight: 900;
        font-size: 24px;
      }
      .skin-blue .main-header .logo span.lab {
        color: white; 
      }
      .skin-blue .main-header .logo span.dash {
        color: #5c9dd8; 
        margin-left: 2px; 
      }
      .main-header {
        height: 20px;
        line-height: 20px;
      }
      .widget-container {
        background-color: #ffffff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        padding: 15px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        margin-bottom: 20px;
      }
      .widget-container:hover {
        transform: translateY(-5px);
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
      }
      .btn-custom {
        background-color: #5c9dd8;
        color: white;
        font-weight: bold;
        border-radius: 25px;
        border: none;
        padding: 10px 20px;
        transition: background-color 0.3s ease;
      }
      .btn-custom:hover {
        background-color: #a35cb7;
      }
      .widget-container img {
        border-radius: 8px;
      }
      .widget-container p {
        margin-top: 10px;
        color: #666;
      }
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
    "))),
    
    tabItems(
      tabItem(tabName = "home",
              h2(style = "font-weight: bold; font-family: 'Roboto', sans-serif;", "Welcome to LabDASH!"),
              
              # Introduction Section
              fluidRow(
                column(12, 
                       div(class = "intro-container",
                           style = "text-align: center; padding: 20px; background-color: #f9f9f9; border-radius: 8px;",
                           p(style = "font-family: 'Roboto', sans-serif; color: #555555; font-size: 16px; line-height: 1.5; padding: 10px 20px;", 
                             "LabDASH is a web-based R Shiny dashboard designed for laboratory professionals. It automates key calculations, making complex procedures quick and accurate. Featuring five calculators, LabDASH simplifies tasks like serial dilutions, stock solution dilutions, buffer preparation, CFU calculations, and MTT assay viability."),
                           p(style = "font-family: 'Roboto', sans-serif; color: #555555; font-size: 16px; line-height: 1.5;", 
                             "With an intuitive interface and dynamic visualizations, LabDASH ensures precision and enhances productivity. Accessible across devices, it’s the perfect tool for streamlining lab work efficiently and confidently."),
                           h4(style = "font-family: 'Roboto', sans-serif; font-weight: bold; color: #323232;", "Experience seemless lab calculations with LabDASH!")
                       )
                ),
                column(4,
                       div(class = "widget-container",
                           img(src = "Serial Dilution.png", height = "150px", style = "width: 100%; height: auto;"),
                           style = "text-align: center;",
                           actionButton("serial_dilution_button", "Go to Tool", icon = icon("arrow-right"), class = "btn-custom", style = "width: 100%;"),
                           p("Learn about Serial Dilution and its applications.")
                       )
                ),
                column(4,
                       div(class = "widget-container",
                           img(src = "Stock dilution.jpg", height = "150px", style = "width: 100%; height: auto;"),
                           style = "text-align: center;",
                           actionButton("stock_dilution_button", "Go to Tool", icon = icon("arrow-right"), class = "btn-custom", style = "width: 100%;"),
                           p("Explore Stock Solution Calculator.")
                       )
                ),
                column(4,
                       div(class = "widget-container",
                           img(src = "Buffer Preperation.png", height = "150px", style = "width: 100%; height: auto;"),
                           style = "text-align: center;",
                           actionButton("buffer_calc_button", "Go to Tool", icon = icon("arrow-right"), class = "btn-custom", style = "width: 100%;"),
                           p("Explore Buffer Preparation tool.")
                       )
                )
              ),
              fluidRow(
                column(4,
                       div(class = "widget-container",
                           img(src = "CFU calculation.jpg", height = "150px", style = "width: 100%; height: auto;"),
                           style = "text-align: center;",
                           actionButton("cfu_button", "Go to Tool", icon = icon("arrow-right"), class = "btn-custom", style = "width: 100%;"),
                           p("Get insights on CFU calculation.")
                       )
                ),
                column(4,
                       div(class = "widget-container",
                           img(src = "Cell Viability.jpg", height = "150px", style = "width: 100%; height: auto;"),
                           style = "text-align: center;",
                           actionButton("mtt_button", "Go to Tool", icon = icon("arrow-right"), class = "btn-custom", style = "width: 100%;"),
                           p("Discover Cell Viability (MTT).")
                       )
                )
              )
      ),
      
      tabItem(tabName = "serial_dilution",
              h2(style = "font-weight: bold; font-family: 'Roboto', sans-serif;", "Serial Dilution Tool"),
              p(style = "font-family: 'Roboto', sans-serif;", "A systematic sequence of dilutions used to lower a substance's concentration in a solution to a more usable concentration is known as a serial dilution. Serial dilutions are created by repeating the same dilution with a certain volume of the prior solutions added to each new dilution. The factor by which the stock is diluted is indicated by a dilution factor, which is frequently employed. In order to create a highly diluted liquid without transferring a very little volume, serial dilutions are often utilized in both biology and chemistry."),
              numericInput("initial_conc", "Initial Concentration (mg/mL)", value = NA, min = 0),
              numericInput("dilution_factor", "Dilution Factor", value = NA, min = 1),
              numericInput("num_dilutions", "Number of Dilutions", value = NA, min = 1),
              numericInput("total_volume", "Total Volume (mL)", value = NA, min = 0),
              actionButton("calculate_button", "Calculate Dilution", class = "btn-custom"),
              br(),
              plotlyOutput("dilution_plot"),
              tableOutput("dilution_table")
      ),
      
      tabItem(tabName = "stock_dilution",
              h2(style = "font-weight: bold; font-family: 'Roboto', sans-serif;", "Stock Solution Dilution Tool"),
              p(style = "font-family: 'Roboto', sans-serif;", "The Stock Solution Dilution tool calculates the required volume of stock solution needed to achieve a desired final concentration. The relationship between the stock concentration and the final concentration is governed by the dilution formula: C1V1 = C2V2, where C1 is the initial concentration, C2 is the final concentration, V1 is the volume of the stock solution, and V2 is the final volume of the solution. This tool is useful for ensuring accurate dilutions in laboratory settings."),
              fluidRow(
                column(4,
                       box(title = "Input Parameters", width = 12,
                           numericInput("stock_conc", "Stock Concentration (M)", value = 1, min = 0, step = 0.01),
                           numericInput("final_conc", "Final Concentration (M)", value = 0.1, min = 0, step = 0.01),
                           numericInput("final_vol", "Final Volume (mL)", value = 100, min = 0, step = 1),
                           helpText("Ensure that this dilution is for one step. Input the starting stock concentration, desired final concentration, and final volume.")
                       )
                ),
                column(8,
                       box(title = "Calculation Results", width = 12,
                           textOutput("stock_vol"),
                           helpText("This calculates the stock volume (V1) using the formula: C1V1 = C2V2, for a single dilution.")
                       )
                )
              )
      ),
      
      tabItem(tabName = "buffer_calc",
              h2(style = "font-weight: bold; font-family: 'Roboto', sans-serif;", "Buffer Preparation Tool"),
              p(style = "font-family: 'Roboto', sans-serif;", "Buffer preparation is a fundamental skill in many scientific fields, including biology and chemistry. Buffers are solutions that resist changes in pH when small amounts of acid or base are added. They are essential for maintaining the appropriate pH in biological experiments and reactions. This tool will assist you in determining the necessary concentrations of acid and base to prepare a buffer solution with a desired pH."),
              fluidRow(
                box(
                  title = "Buffer Calculation Inputs", status = "primary", solidHeader = TRUE,
                  numericInput("pKa", "pKa of the buffer:", value = 4.75, min = 0.1, max = 14),
                  numericInput("desired_pH", "Desired pH:", value = 7, min = 0.1, max = 14),
                  numericInput("acid_conc", "Concentration of Acid (M):", value = 0.1, min = 0.001, max = 10),
                  numericInput("base_conc", "Concentration of Base (M):", value = 0.1, min = 0.001, max = 10),
                  numericInput("total_vol", "Total Volume of Buffer (mL):", value = 100, min = 1, max = 1000),
                  actionButton("calculate", "Calculate", class = "btn-custom")  # Add Calculate button
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
              )
      ),
      
      tabItem(tabName = "cfu",
              h2(style = "font-weight: bold; font-family: 'Roboto', sans-serif;", "Colony Forming Units (CFU) Calculator"),
              numericInput("colonies", "Number of colonies:", value = 100, min = 1, max = 500, step = 1),
              selectInput("dilution", "Select Dilution Factor:",
                          choices = c(1, 10, 100, 1000, 10000), selected = 10000),
              numericInput("volume", "Volume plated (mL):", value = 0.1, min = 0.01, max = 1, step = 0.01),
              
              h3(textOutput("cfu_output")),
              
              # Explanation Text
              h4("CFU (Colony Forming Unit) Calculator Explanation:"),
              p("CFU (Colony Forming Units) refers to the number of viable bacterial or fungal cells in a sample that can form colonies on an agar plate. This is critical in microbiology to quantify bacterial growth or concentration in a sample. The general formula to calculate CFU per milliliter (CFU/mL) is:"),
              pre("CFU/mL = (Number of colonies × Dilution factor) / Volume plated (mL)"),
              
              tags$ul(
                tags$li("Number of colonies: The number of colonies counted on the plate."),
                tags$li("Dilution factor: The dilution that was plated."),
                tags$li("Volume plated (mL): The volume of the diluted solution plated on the agar.")
              ),
      ),
      # MTT Assay Tab
      tabItem(tabName = "mtt",
              h2(style = "font-weight: bold; font-family: 'Roboto', sans-serif;", "MTT Assay Tool"),
              p(style = "font-family: 'Roboto', sans-serif;", "The MTT assay is a colorimetric assay for assessing cell metabolic activity. The amount of formazan product generated is proportional to the number of viable cells."),
              numericInput("abs_treated", "Absorbance Treated", value = NA, min = 0),
              numericInput("abs_control", "Absorbance Control", value = NA, min = 0),
              actionButton("calculate", "Calculate Viability", class = "btn-custom"),
              br(),
              textOutput("viability_output"),
              plotOutput("viability_plot")
      )
    )
  )
)



# Define server logic for the application
server <- function(input, output, session) {
  observeEvent(input$serial_dilution_button, {
    updateTabItems(session, "sidebar", "serial_dilution")
  })
  
  observeEvent(input$stock_dilution_button, {
    updateTabItems(session, "sidebar", "stock_dilution")
  })
  
  observeEvent(input$buffer_calc_button, {
    updateTabItems(session, "sidebar", "buffer_calc")
  })
  
  observeEvent(input$cfu_button, {
    updateTabItems(session, "sidebar", "cfu")
  })
  
  observeEvent(input$mtt_button, {
    updateTabItems(session, "sidebar", "mtt")
  })
  
  # Reactive output for the required stock volume
  output$stock_vol <- renderText({
    if(input$stock_conc > 0 && input$final_conc > 0 && input$final_vol > 0) {
      if(input$final_conc < input$stock_conc) {
        stock_vol <- (input$final_conc * input$final_vol) / input$stock_conc
        paste("Required volume of stock solution for one-step dilution:", round(stock_vol, 2), "mL")
      } else {
        "Final concentration must be less than stock concentration for dilution."
      }
    } else {
      "Please enter positive values for stock concentration, final concentration, and final volume."
    }
  })
  
  # Calculate dilution and generate plot when button is clicked
  observeEvent(input$calculate_button, {
    req(input$initial_conc, input$dilution_factor, input$num_dilutions, input$total_volume)
    
    # Perform the dilution calculation
    dilution_results <- calculate_dilution(input$initial_conc, input$dilution_factor, input$total_volume, input$num_dilutions)
    
    # Generate the plot
    output$dilution_plot <- renderPlotly({
      gg <- ggplot(dilution_results, aes(x = Dilution_Step, y = Concentration)) +
        geom_line(color = "#5c9dd8", size = 1) +
        geom_point(color = "#4e99c7", size = 3) +
        labs(title = "Serial Dilution Concentrations", x = "Dilution Step", y = "Concentration (mg/mL)") +
        theme_minimal() +
        theme(plot.title = element_text(hjust = 0.5, size = 20, face = "bold"),
              axis.title.x = element_text(size = 14),
              axis.title.y = element_text(size = 14))
      ggplotly(gg)
    })
    
    # Render the dilution table
    output$dilution_table <- renderTable({
      dilution_results
    })
  })
  
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
  
  # Calculate CFU/mL and display output
  cfu <- reactive({
    colonies <- input$colonies
    dilution <- as.numeric(input$dilution)  # Ensures dilution is numeric from selectInput
    volume <- input$volume
    
    # CFU/mL Calculation formula:
    (colonies * dilution) / volume
  })
  
  output$cfu_output <- renderText({
    paste("CFU/mL:", format(round(cfu(), 2), big.mark = ",", scientific = FALSE))
  })
  # Observe when the calculate button is clicked
  observeEvent(input$calculate, {
    
    # Check if inputs are provided and handle invalid entries
    if (is.null(input$abs_treated) || is.null(input$abs_control) || input$abs_control == 0) {
      output$viability_output <- renderText("Please enter valid absorbance values.")
    } else {
      # Perform the viability calculation
      viability <- (input$abs_treated / input$abs_control) * 100
      
      # Display the result as text
      output$viability_output <- renderText({
        paste("Cell Viability:", round(viability, 2), "%")
      })
      
      # Prepare the data for plotting
      plot_data <- data.frame(
        Condition = c("Control", "Treated"),
        Absorbance = c(input$abs_control, input$abs_treated)
      )
      
      # Create the plot using ggplot2 with vibrant colors
      output$viability_plot <- renderPlot({
        ggplot(plot_data, aes(x = Condition, y = Absorbance, fill = Condition)) +
          geom_bar(stat = "identity", width = 0.5, color = "black") +
          geom_text(aes(label = round(Absorbance, 2)), vjust = -0.5, size = 5) +
          scale_fill_manual(values = c("Control" = "#0073C2FF", "Treated" = "#EFC000FF")) +
          ylim(0, max(input$abs_control, input$abs_treated) * 1.2) +
          ggtitle("Absorbance Comparison: Control vs Treated") +
          ylab("Absorbance") +
          xlab("Condition") +
          theme_minimal() +
          theme(
            plot.title = element_text(hjust = 0.5, size = 20),
            axis.title.x = element_text(size = 14),
            axis.title.y = element_text(size = 14),
            axis.text = element_text(size = 12),
            legend.position = "none"
          )
      })
    }
  })
}


#rsconnect::setAccountInfo(name='',
                        #token='',
                        #secret='')


# Run the application 
shinyApp(ui = ui, server = server)
#rsconnect::deployApp(appName = "", account = "", server = "", id = "")