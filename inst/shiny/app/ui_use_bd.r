tabPanel(uiOutput("utbanco"),                     
 column(3,
  wellPanel(
   helpText(h4(uiOutput("templ1"))), 
   uiOutput("headexamsUI"),
   textInput('textanol',h5(uiOutput("templ6")),value='2020/2'),
   textInput('textname',h5(uiOutput("templ7")),value='Achim Zeileis')
   )),
 column(8,
  wellPanel(
   numericInput('numquestion',
    h4(uiOutput("templ8")),
    value=1),
   helpText(h4(uiOutput("esbanqu"))),

   source('../../aux_files/widgets/current/widgets.r',local=TRUE)$value

   ),

  actionButton("downloadPDF", uiOutput("botpdf"),icon=icon("download")),
  actionButton("downloadXML", uiOutput("botxml"),icon=icon("download")),
  downloadButton("downloadQuestions", uiOutput("botzip")) 

  ))
