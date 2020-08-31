tabPanel(uiOutput("gdatbanco"),
 wellPanel( 
  uiOutput("up_file"),
  actionButton("atubanco",
   icon = icon("refresh"),
   uiOutput("gdatb")))
)
