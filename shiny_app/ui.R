

header <- dashboardHeader(
  title = "TSLA Model"
)

sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Inputs", tabName = "inputs", icon = icon("keyboard")),
    menuItem("ASP Tables", tabName = "asp", icon = icon("tag")),
    menuItem("Monte Carlo", tabName = "monte_carlo", icon = icon("chart-area")),
    menuItem("Valuation", tabName = "valuation", icon = icon("file-invoice-dollar")),
    tags$div(
      style = "position: absolute; bottom: 0;",
      a(
        img(
          src = "https://res.cloudinary.com/dxqnb8xjb/image/upload/v1509563497/tychobra-logo-blue_dacbnz.svg",
          width = 50
        ),
        href = "https://tychobra.com/shiny"
      )
    )
  )
)

body <- dashboardBody(
  tags$head(
    #tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
    #tags$script(src = "custom.js"),
    tags$link(rel="icon", href="https://res.cloudinary.com/dxqnb8xjb/image/upload/v1499450435/logo-blue_hnvtgb.png")
  ),
  tabItems(
    tabItem(
      tabName = "inputs",
      fluidRow(
        column(
          width = 12,
          inputs_module_ui("inputs")
        )
      )
    ),
    tabItem(
      tabName = "asp",
      fluidRow(
        column(
          width = 12,
          h1("ASP")
        )
      )
    ),
    tabItem(
      tabName = "monte_carlo",
      fluidRow(
        column(
          width = 12,
          h1("Monte Carlo")
        )
      )
    ),
    tabItem(
      tabName = "valuation",
      fluidRow(
        column(
          width = 12,
          h1("Valuation")
        )
      )
    )
  )
)

dashboardPage(
  header,
  sidebar,
  body,
  skin = "black"
)
