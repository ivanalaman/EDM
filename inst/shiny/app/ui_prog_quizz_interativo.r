tabPanel(uiOutput("minterativo"),
 fluidRow(
  column(width = 4,
   #HTML("<h3>Questão dissertativa do tipo <em>texto</em>!</h3>"),
   wellPanel(
    h3(uiOutput("qdissertexto")),
    uiOutput("textAtextoUI"), 
    uiOutput("radiotextUI"),
    conditionalPanel(
     condition = "input.figtext == 1",
     textAreaInput("figureqtext",
      label=h4(uiOutput("tpathfig")),
      width="300px",
      height="30px",
      value = "C:/users/ivan/documentos/R/win-library/4.0/EDM/questionbank/brazil/IBA/basica/introducao/discursivas/facil/figuras/diagramavenn.png")),
    uiOutput("textAtextorespUI"), 
    downloadButton("download_qtext",label=uiOutput("bsalvar"))
    )),
  column(width = 4,
   #HTML("<h3>Questão dissertativa do tipo <em>numérica</em>!</h3>"),
   wellPanel(
    h3(uiOutput("qdissernum")),
    uiOutput("textAnumUI"), 
    uiOutput("radionumUI"),  
    conditionalPanel(
     condition = "input.fignum == 1",
     textAreaInput("figureqnum",
      label=h4(uiOutput("tpathfig1")),
      width="300px",
      height="30px",
      value = "C:/users/ivan/documentos/R/win-library/4.0/EDM/questionbank/brazil/IBA/basica/introducao/discursivas/facil/figuras/figdado.png")),
    uiOutput("textAnumrespUI"), 
    numericInput("solutionqnum",
     label=h4(uiOutput("trespnum")),
     value = 3),
    numericInput("tolqnum",
     label=h4(uiOutput("ttol")),
     value = 0.01),
    downloadButton("download_qnum",label=uiOutput("bsalvar1"))
    )),
  column(width = 4,
   #HTML("<h3>Questão do tipo <em>única escolha</em>!</h3>"),
   wellPanel(
    h3(uiOutput("qunicaesc")),
    uiOutput("textAunicaUI"), 
    uiOutput("radiounicaUI"),  
    conditionalPanel(
     condition = "input.figuni == 1",
     textAreaInput("figurequnic",
      label=h4(uiOutput("tpathfig2")),
      width="300px",
      height="30px",
      value = "C:/users/ivan/documentos/R/win-library/4.0/EDM/questionbank/brazil/IBA/basica/introducao/discursivas/facil/figuras/fighist.png")),
    fluidRow(
     column(width=4,
      #HTML("<h4>Escreva as alternativas abaixo</h4>"),
      h4(uiOutput("talternativa")),
      tags$style(type="text/css","#altuea{ margin-top:19px } #altueb{ margin-top:-30px } #altuec{ margin-top:-30px } #altued{ margin-top:-30px } #altuee{ margin-top:-30px }"),
      uiOutput("altunicaUI") 
      ),
     column(width=4,
      #HTML("<h4>Escreva a resposta como sugere o exemplo!</h4>"),
      h4(uiOutput("tresposta")),
      tags$style(type="text/css","#altuearesp{ margin-top:-20px } #altuebresp{ margin-top:-30px } #altuecresp{ margin-top:-30px } #altuedresp{ margin-top:-30px } #altueeresp{ margin-top:-30px }"),
      textInput("altuearesp",label="",value="FALSE"),
      textInput("altuebresp",label="",value="TRUE"),
      textInput("altuecresp",label="",value="FALSE"),
      textInput("altuedresp",label="",value="FALSE"),
      textInput("altueeresp",label="",value="FALSE")
     )
     ),
    downloadButton("download_qunica",label=uiOutput("bsalvar2"))
    ))
  ),
 fluidRow(
  column(width=4,
   #HTML("<h3>Questão do tipo <em>múltipla escolha</em>!</h3>"),
   wellPanel(
    h3(uiOutput("qmultesc")),
    uiOutput("textAmultUI"),
    uiOutput("radiomultiUI"),   
    conditionalPanel(
     condition = "input.figmul == 1",
     textAreaInput("figureqmul",
      label=h4(uiOutput("tpathfig3")),
      width="300px",
      height="30px",
      value = "C:/users/ivan/documentos/R/win-library/4.0/EDM/questionbank/brazil/IBA/basica/introducao/discursivas/facil/figuras/fighist.png")),
    fluidRow(
     column(width=4,
      #HTML("<h4>Escreva as alternativas abaixo</h4>"),
      h4(uiOutput("talternativa2")),
      tags$style(type="text/css","#add_btnqm{margin-top:38px}"),
      actionButton("add_btnqm", 
       label="",
       icon=icon('plus'),
       width='110px'),
      uiOutput("qmultipleUI")
      ),
     column(width=4,
      #HTML("<h4>Escreva a resposta como sugere o exemplo!</h4>"),
      h4(uiOutput("tresposta2")),
      actionButton("rm_btnqm", 
       label="",
       icon=icon('trash-alt'),
       width='110px'),
      uiOutput("qmultiplerespUI")
     )
     ),
    downloadButton("download_qmesc",label=uiOutput("bsalvar3"))
    )),
  column(width=4,
   #HTML("<h3>Questão do tipo <em>associativa</em>!</h3>"),
   wellPanel(
    h3(uiOutput("qassocia")),
    uiOutput("textAassoUI"), 
    uiOutput("radioassoUI"),    
    conditionalPanel(
     condition = "input.figass == 1",
     textAreaInput("figureqass",
      label=h4(uiOutput("tpathfig4")),
      width="300px",
      height="30px",
      value = "C:/users/ivan/documentos/R/win-library/4.0/EDM/questionbank/brazil/IBA/basica/introducao/discursivas/facil/figuras/fighist.png")),
    #HTML("<h4>Escreva as condições abaixo</h4>"),
    h4(uiOutput("tcondicao")),
    actionButton("add_btnqacond", 
     label="",icon=icon('plus'),
     width='110px'),
    actionButton("rm_btnqacond", 
     label="",icon=icon('trash-alt'),
     width='110px'),
    uiOutput("qasscondiUI"),
    fluidRow(
     column(width=4,
      #HTML("<h4>Escreva as alternativas abaixo</h4>"),
      h4(uiOutput("talternativa3")),
      tags$style(type="text/css","#add_btnqaalt{margin-top:38px}"),
      actionButton("add_btnqaalt", 
       label="",icon=icon('plus'),
       width='110px'),
      uiOutput("qassaltUI")
      ),
     column(width=4,
      #HTML("<h4>Escreva a resposta como sugere o exemplo!</h4>"),
      h4(uiOutput("tresposta3")),
      actionButton("rm_btnqaaltresp", 
       label="",icon=icon('trash-alt'),
       width='110px'),
      uiOutput("qassaltrespUI")
     )
     ),
    downloadButton("download_qass",label=uiOutput("bsalvar4"))
    )),
  column(width=4,
   #HTML("<h3>Questão do tipo <em>mista</em>!</h3>"),
   wellPanel(
    h3(uiOutput("qmista")),
    uiOutput("textAmistaUI"), 
    uiOutput("radiomistaUI"),    
    conditionalPanel(
     condition = "input.figmist == 1",
     textAreaInput("figureqmist",
      label=h4(uiOutput("tpathfig5")),
      width="300px",
      height="30px",
      value = "C:/users/ivan/documentos/R/win-library/4.0/EDM/questionbank/brazil/IBA/basica/introducao/discursivas/facil/figuras/fighist.png")),
    fluidRow(
     column(width=4,
      #HTML("<h4>Escreva as alternativas abaixo</h4>"),
      h4(uiOutput("talternativa4")),
      tags$style(type="text/css","#add_btnqmist{margin-top:38px}"),
      actionButton("add_btnqmist", 
       label="",icon=icon('plus'),
       width='110px'),
      uiOutput("qmistUI")
      ),
     column(width=4,
      #HTML("<h4>Escreva a resposta como sugere o exemplo!</h4>"),
      h4(uiOutput("tresposta4")),
      actionButton("rm_btnqmistresp", 
       label="",icon=icon('trash-alt'),
       width='110px'),
      uiOutput("qmistrespUI")
     )
     ),
    downloadButton("download_qmist",label=uiOutput("bsalvar5"))
    ))
 )
)
