navbarMenu(uiOutput("mninterativo"),
 tabPanel(uiOutput("tquestaoa"),         
  tags$meta(content="text/html; charset=utf-8"),
  uiOutput("exeabertat"),
  tags$head(tags$script(src="script_savetextarea.js")), 
  tags$input(type = "button",              
   value = "Salvar!",
   class = "btn btn-default",
   onClick = "saveTextAsFile1()")), 

 tabPanel(uiOutput("tquestaon"),              
  tags$meta(content="text/html; charset=utf-8"),
  uiOutput("exeabertan"),
  tags$head(tags$script(src="script_savetextarea2.js")), 
  tags$input(type = "button",              
   value = "Salvar!",
   class = "btn btn-default",
   onClick = "saveTextAsFile2()")),

 tabPanel(uiOutput("tquestaom"),              
  tags$meta(content="text/html; charset=utf-8"),
  uiOutput("exemultiplaes"),
  tags$head(tags$script(src="script_savetextarea3.js")), 
  tags$input(type = "button",              
   value = "Salvar!",
   class = "btn btn-default",
   onClick = "saveTextAsFile3()")),   

 tabPanel(uiOutput("tquestaos"),               
  tags$meta(content="text/html; charset=utf-8"),
  uiOutput("exeunicaes"),
  tags$head(tags$script(src="script_savetextarea4.js")), 
  tags$input(type = "button",              
   value = "Salvar!",
   class = "btn btn-default",
   onClick = "saveTextAsFile4()")),    

 tabPanel(uiOutput("associacao"),               
  tags$meta(content="text/html; charset=utf-8"),
  uiOutput("exeassociacao"),
  tags$head(tags$script(src="script_savetextarea5.js")), 
  tags$input(type = "button",              
   value = "Salvar!",
   class = "btn btn-default",
   onClick = "saveTextAsFile5()")),

 tabPanel(uiOutput("mista"),              
  tags$meta(content="text/html; charset=utf-8"), 
  uiOutput("exemista"),
  tags$head(tags$script(src="script_savetextarea6.js")), 
  tags$input(type = "button",              
   value = "Salvar!",
   class = "btn btn-default",
   onClick = "saveTextAsFile6()"))
)
