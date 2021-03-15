# Define UI for dataset viewer application
shinyUI(
 navbarPage(
  id = "navbar",
  theme = "bootstrap.css",
  tags$head(tags$style(HTML("
     .shiny-text-output {
      background-color:#fff;
     };
     "))),
     source("ui_home.r",local=TRUE)$value,
     source("ui_create_remove_bd.r",local=TRUE)$value,
     source("ui_create_newcourse_matter.r",local=TRUE)$value,
     #tabPanel(uiOutput("envbanco")),
     source("ui_prog_quizz.r",local=TRUE)$value,
     source("ui_use_bd.r",local=TRUE)$value,
     source("ui_update_bd.r",local=TRUE)$value, 
     tabPanel(uiOutput("tutorial"),
      uiOutput("up_guide")),
     #      tabPanel("Debug",
     #       verbatimTextOutput("teste")),
     source("ui_update_app.r",local=TRUE)$value,
     #tabPanel(title="",value="closeapp",icon=icon("power-off")),
     source("ui_poweroff.r",local=TRUE)$value,
     shinyjs::useShinyjs()
     ))
