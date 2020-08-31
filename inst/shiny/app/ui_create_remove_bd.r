navbarMenu(uiOutput("criarrem"),
 tabPanel(uiOutput("criar"),
  column(5,
   wellPanel(
    uiOutput('ccountry'),
    textInput('yourname',
     label = h4(uiOutput("compname")),
     value = 'Achim Zeileis') , 
    textInput('text',
     label = h4(uiOutput("escsigla")),
     value = 'ACZ')
   )
   ),
  column(5,
   wellPanel(
    textInput('ydiscp', 
     label = h4(uiOutput("ndiscp")),
     value = 'estatistica_computacional'),
    textInput('yassun', 
     label = h4(uiOutput("nassun")), 
     value = 'geracao_numeros_uniformes')
   )
   ),
  column(2,
   actionButton('gerarb',
    uiOutput("gbanco"))
  )
  ),
 tabPanel(uiOutput("remover"),
  wellPanel(
   uiOutput('removee')
   ),
  actionButton('removerb',
   uiOutput("rebanco"))
 )
)
