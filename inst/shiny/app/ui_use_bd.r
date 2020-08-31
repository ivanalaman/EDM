tabPanel(uiOutput("utbanco"),                     
 column(3,
  wellPanel(
   helpText(h4(uiOutput("templ1"))), 
   textInput('textaval',h5(uiOutput("templ2")),value='1º Avaliação'),
   textInput('textunid',h5(uiOutput("templ3")),value='Ciências Exatas e Tecnológicas'),
   textInput('textdisc',h5(uiOutput("templ4")),value='CET173 - Probabilidade e Estatística'),
   textInput('textcarg',h5(uiOutput("templ5")),value='60 horas'),
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

  downloadButton("downloadPDF", uiOutput("botpdf")),
  downloadButton("downloadXML", uiOutput("botxml")),
  downloadButton("downloadQuestions", uiOutput("botzip")) 

  ))
