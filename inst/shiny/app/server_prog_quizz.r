#++++++++++++++ Questão do tipo dissertativa texto +++++++++++++++#

bsimm <- reactive({
     res <- list('sim' = 1, 'nao' = 2)
         names(res) <- c(tr('bsim'),tr('bnao'))
         res
})

output$textAtextoUI <- renderUI({
 textAreaInput("titlequestiontext",
  label=h4(uiOutput("tquestaoaa")),
  width="300px",
  height="30px",
  value = tr("questexto"))
})

output$textAtextorespUI <- renderUI({
 textAreaInput("solutionqtext",
  label=h4(uiOutput("tquestaoas")),
  width="300px",
  value = tr("resptexto"))
})

output$radiotextUI <- renderUI({
 radioButtons("figtext",
  label = h4(uiOutput("tfigura")),
  choices = bsimm(), 
  selected = 2)
})

captureqtext <- reactive({

 if(input$figtext == 1){
  paste('<<echo=FALSE,results=hide>>= 
   \n@ 
  \n\\begin{question}\n',
  input$titlequestiontext,
  '\n\n\\begin{figure}[H]\n\\centering\n\\includegraphics{',input$figureqtext,'}\n\\end{figure}\n\\end{question}
  \n\n\\begin{solution} \n',
  input$solutionqtext,
  '\n\\end{solution}
  \n%% META-INFORMATION\n%% \\extype{string}\n%% \\exsolution{"Aberta"}',
  sep='')

 } else {
  paste('<<echo=FALSE,results=hide>>= 
   \n@ 
  \n\\begin{question}\n',
  input$titlequestiontext,
  '\n\\end{question}
  \n\n\\begin{solution} \n',
  input$solutionqtext,
  '\n\\end{solution}
  \n%% META-INFORMATION\n%% \\extype{string}\n%% \\exsolution{"Aberta"}',
  sep='')

 }
})

output$download_qtext <- downloadHandler(
 filename = function(){
  "myfile.Rnw"
 },
 content = function(file) {
  write(captureqtext(),file) 
 }
)

#++++++++++++++ Questão do tipo dissertativa numérica +++++++++++++++#
output$textAnumUI <- renderUI({
 textAreaInput("titlequestionnum",
  label=h4(uiOutput("tquestaoaa1")),
  width="300px",
  height="100px",
  value = tr("quesnum"))
})

output$textAnumrespUI <- renderUI({
 textAreaInput("resolutionqnum",
  label=h4(uiOutput("tquestaoas1")),
  value = tr("resolnum"))
})

output$radionumUI <- renderUI({radioButtons("fignum",
 label = h4(uiOutput("tfigura1")),
 choices = bsimm(), 
 selected = 2)
  })

captureqnum <- reactive({

 if(input$fignum == 1){
  paste('<<echo=FALSE,results=hide>>= 
   \n@ 
  \n\\begin{question}\n',
  input$titlequestionnum,
  '\n\n\\begin{figure}[H]\n\\centering\n\\includegraphics{',input$figureqnum,'}\n\\end{figure}\n\\end{question}
  \n\n\\begin{solution} \n',
  input$resolutionqnum,
  '\n\\end{solution}
  \n%% META-INFORMATION\n%% \\extype{num}\n%% \\exsolution{',
  input$solutionqnum,
  '}\n%% \\extol{',
  input$tolqnum,
  '}',
  sep='')
  } else {
   paste('<<echo=FALSE,results=hide>>= 
    \n@ 
   \n\\begin{question}\n',
   input$titlequestionnum,
   '\n\\end{question}
   \n\n\\begin{solution} \n',
   input$resolutionqnum,
   '\n\\end{solution}
   \n%% META-INFORMATION\n%% \\extype{num}\n%% \\exsolution{',
   input$solutionqnum,
   '}\n%% \\extol{',
   input$tolqnum,
   '}',
   sep='')
   }
  })

output$download_qnum <- downloadHandler(
 filename = function(){
  "myfile.Rnw"
 },
 content = function(file) {
  write(captureqnum(),file) 
 }
)

#+++++++++ Questão do tipo única escolha +++++++++++++#
output$textAunicaUI <- renderUI({
 textAreaInput("titlequestionunic", 
  label=h4(uiOutput("tquestaoaa2")),
  width="300px",
  height="100px",
  value = tr("quesunica"))
})

output$altunicaUI <- renderUI({
 tagList(
  textInput("altuea",label="",value=tr("alta")),
  textInput("altueb",label="",value=tr("altb")),
  textInput("altuec",label="",value=tr("altc")),
  textInput("altued",label="",value=tr("altd")),
  textInput("altuee",label="",value=tr("alte"))
 )
})

output$radiounicaUI <- renderUI({
 radioButtons("figuni",
  label = h4(uiOutput("tfigura2")),
  choices = bsimm(), 
  selected = 2)
})

capturequnica <- reactive({

 if(input$figuni == 1){
  paste('<<echo=FALSE,results=hide>>=\nquestions <- solutions <- NULL\nquestions[1] <- "',
   input$altuea,
   '"\nsolutions[1] <-',
   input$altuearesp,
   '\nquestions[2] <- "',
   input$altueb,
   '"\nsolutions[2] <-',
   input$altuebresp,
   '\nquestions[3] <- "',
   input$altuec,
   '"\nsolutions[3] <- ',
   input$altuecresp,
   '\nquestions[4] <- "',
   input$altued,
   '"\nsolutions[4] <- ',
   input$altuedresp,
   '\nquestions[5] <- "',
   input$altuee,
   '"\nsolutions[5] <- ',
   input$altueeresp,  
   '\no <- sample(1:5)\nquestions <- questions[o]\nsolutions <- solutions[o]\n@ 

   \n\\begin{question}\n',
   input$titlequestionunic,
   '\n\n\\begin{figure}[H]\n\\centering\n\\includegraphics{',input$figurequnic,'}\n\\end{figure}\n\n\\begin{answerlist}\n\\item \\Sexpr{questions[1]}\n\\item \\Sexpr{questions[2]}\n\\item \\Sexpr{questions[3]}\n\\item \\Sexpr{questions[4]}\n\\item \\Sexpr{questions[5]}\n\\end{answerlist}\n\\end{question}\n\n\\begin{solution}\n\\begin{answerlist}\n\\item \\Sexpr{mchoice2text(solutions[1])}\n\\item \\Sexpr{mchoice2text(solutions[2])}\n\\item \\Sexpr{mchoice2text(solutions[3])}\n\\item \\Sexpr{mchoice2text(solutions[4])}\n\\item \\Sexpr{mchoice2text(solutions[5])}\n\\end{answerlist}\n\\end{solution}
   \n\n%% META-INFORMATION\n%% \\extype{schoice}\n%% \\exsolution{\\Sexpr{mchoice2string(solutions,single=TRUE)}}',
   sep='')
 } else {
  paste('<<echo=FALSE,results=hide>>=\nquestions <- solutions <- NULL\nquestions[1] <- "',
   input$altuea,
   '"\nsolutions[1] <-',
   input$altuearesp,
   '\nquestions[2] <- "',
   input$altueb,
   '"\nsolutions[2] <-',
   input$altuebresp,
   '\nquestions[3] <- "',
   input$altuec,
   '"\nsolutions[3] <- ',
   input$altuecresp,
   '\nquestions[4] <- "',
   input$altued,
   '"\nsolutions[4] <- ',
   input$altuedresp,
   '\nquestions[5] <- "',
   input$altuee,
   '"\nsolutions[5] <- ',
   input$altueeresp,  
   '\no <- sample(1:5)\nquestions <- questions[o]\nsolutions <- solutions[o]\n@ 

   \n\\begin{question}\n',
   input$titlequestionunic,
   '\n\n\\begin{answerlist}\n\\item \\Sexpr{questions[1]}\n\\item \\Sexpr{questions[2]}\n\\item \\Sexpr{questions[3]}\n\\item \\Sexpr{questions[4]}\n\\item \\Sexpr{questions[5]}\n\\end{answerlist}\n\\end{question}
   \n\n\\begin{solution}\n\\begin{answerlist}\n\\item \\Sexpr{mchoice2text(solutions[1])}\n\\item \\Sexpr{mchoice2text(solutions[2])}\n\\item \\Sexpr{mchoice2text(solutions[3])}\n\\item \\Sexpr{mchoice2text(solutions[4])}\n\\item \\Sexpr{mchoice2text(solutions[5])}\n\\end{answerlist}\n\\end{solution}
   \n\n%% META-INFORMATION\n%% \\extype{schoice}\n%% \\exsolution{\\Sexpr{mchoice2string(solutions,single=TRUE)}}',
   sep='')
 }
})

output$download_qunica <- downloadHandler(
 filename = function(){
  "myfile.Rnw"
 },
 content = function(file) {
  write(capturequnica(),file) 
 }
)

#+++++++++ Questão do tipo múltipla escolha ++++++++++#
output$textAmultUI <- renderUI({
 textAreaInput("titlequestionmult", 
  label=h4(uiOutput("tquestaoaa3")),
  width="300px",
  height="100px",
  value = tr("quesmult"))
})

output$radiomultiUI <- renderUI({
 radioButtons("figmul",
  label = h4(uiOutput("tfigura3")),
  choices = bsimm(), 
  selected = 2)
})

countermesc <- reactiveValues(n = 3)

observeEvent(input$add_btnqm, {countermesc$n <- countermesc$n + 1})
observeEvent(input$rm_btnqm, {
 if (countermesc$n > 3) countermesc$n <- countermesc$n - 1
})

output$qmultipleUI <- renderUI({
 n <- countermesc$n 

 if(n > 3){
  lapply(seq_len(n), function(i) {
   tagList(
   tags$style(type="text/css",paste0("#altmue1{margin-top:0px} #altmue2{margin-top:-30px} #altmue3{margin-top:-30px} #altmue",i,"{margin-top:-30px}")),
   textInput(inputId = paste0("altmue",i),
    label="",
    width="110px",
    value=paste0(letters[i],")Escreva o texto aqui!"))
   )
  })
 }else{
  tagList(
   tags$style(type="text/css",paste0("#altmue1{margin-top:0px} #altmue2{margin-top:-30px} #altmue3{margin-top:-30px}")),
   textInput(inputId = "altmue1",
    label="",
    width="110px",
    value=tr("altmulta")),
   textInput(inputId = "altmue2",
    label="",
    width="110px",
    value=tr("altmultb")),
   textInput(inputId = "altmue3",
    label="",
    width="110px",
    value=tr("altmultc"))
  )
 }
})

output$qmultiplerespUI <- renderUI({
 n <- countermesc$n 

 if(n > 3){
  lapply(seq_len(n), function(i) {
   tagList(
   tags$style(type="text/css",paste0("#altmuearesp1{margin-top:0px} #altmuearesp2{margin-top:-30px} #altmuearesp3{margin-top:-30px} #altmuearesp",i,"{margin-top:-30px}")),
   textInput(inputId = paste0("altmuearesp",i),
    label="",
    width="110px",
    value="FALSE")
   )
  })
 }else{
  tagList(
   tags$style(type="text/css",paste0("#altmuearesp1{margin-top:0px} #altmuearesp2{margin-top:-30px} #altmuearesp3{margin-top:-30px}")),
   textInput(inputId = "altmuearesp1",
    label="",
    width="110px",
    value="FALSE"),
   textInput(inputId = "altmuearesp2",
    label="",
    width="110px",
    value="TRUE"),
   textInput(inputId = "altmuearesp3",
    label="",
    width="110px",
    value="TRUE")
  )
 }
})

captureqmesc <- reactive({
 n <- countermesc$n

 if(n > 3){

  ini <- '<<echo=FALSE,results=hide>>=\nquestions <- solutions <- NULL'

  meio <- NULL
  for(i in 1:n){
   meio[i] <- paste0("\nquestions[",i,"] <- '",
    input[[paste0("altmue", i)]],
    "' \nsolutions[",
    i,
    "] <- ",
    input[[paste0("altmuearesp",i)]])
  }

  meio2 <- paste0(meio,collapse='')

  fim <- paste0('\no <- sample(1:',n,')\nquestions <- questions[o]\nsolutions <- solutions[o]\n@')

  chunk <- paste0(ini,meio2,fim,collapse='')

  if(input$figmul == 1){
   meioques <- paste0('\n\n\\begin{question}\n',
    input$titlequestionmult, 
    '\n\n\\begin{figure}[H]\n\\centering\n\\includegraphics{',input$figureqmul,'}\n\\end{figure}
    \n\n\\begin{answerlist}')
  }else{
   meioques <- paste0('\n\n\\begin{question}\n',
    input$titlequestionmult, 
    '\n\n\\begin{answerlist}')
  } 

  meioquesans <- paste0(paste0('\n\\item \\Sexpr{questions[',1:n,']}'),collapse='')

  meioans <- '\n\\end{answerlist}\n\\end{question}  
  \n\\begin{solution} 
  \n\\begin{answerlist}'

  meioanssol <- paste0(paste0('\n\\item \\Sexpr{mchoice2text(solutions[',1:n,'])}'),collapse='')

  fim <- '\n\\end{answerlist}\n\\end{solution}
  \n\n%% META-INFORMATION\n%% \\extype{mchoice}\n%% \\exsolution{\\Sexpr{mchoice2string(solutions, single=FALSE)}}'

  latex <- paste0(meioques,meioquesans,meioans,meioanssol,fim,collapse='')

  paste0(chunk,latex)

 }else{
  ini <- '<<echo=FALSE,results=hide>>=\nquestions <- solutions <- NULL'

  meio <- paste0("\nquestions[1] <- '",
   input$altmue1,
   "' \nsolutions[1] <- ",
   input$altmuearesp1,
   "\nquestions[2] <- '",
   input$altmue2,
   "' \nsolutions[2] <- ",
   input$altmuearesp2,
   "\nquestions[3] <- '",
   input$altmue3,
   "' \nsolutions[3] <- ",
   input$altmuearesp3,
   '\n@',
   collapse="")

  chunk <- paste0(ini,meio,collapse='')

  if(input$figmul == 1){
   meioques <- paste0('\n\n\\begin{question}\n',
    input$titlequestionmult, 
    '\n\n\\begin{figure}[H]\n\\centering\n\\includegraphics{',input$figureqmul,'}\n\\end{figure}
    \n\n\\begin{answerlist}')
  }else{
   meioques <- paste0('\n\n\\begin{question}\n',
    input$titlequestionmult, 
    '\n\n\\begin{answerlist}')
  } 

  meioquesans <- paste0('\n\\item \\Sexpr{questions[1]} \n\\item \\Sexpr{questions[2]} \n\\item \\Sexpr{questions[3]}',collapse='')

  meioans <- '\n\\end{answerlist}\n\\end{question}  
  \n\\begin{solution} 
  \n\\begin{answerlist}'

  meioanssol <- paste0('\n\\item \\Sexpr{mchoice2text(solutions[1])} \n\\item \\Sexpr{mchoice2text(solutions[2])} \n\\item \\Sexpr{mchoice2text(solutions[3])}',collapse='')

  fim <- '\n\\end{answerlist}\n\\end{solution}
  \n\n%% META-INFORMATION\n%% \\extype{mchoice}\n%% \\exsolution{\\Sexpr{mchoice2string(solutions, single=FALSE)}}'

  latex <- paste0(meioques,meioquesans,meioans,meioanssol,fim,collapse='')

  paste0(chunk,latex)

 }
})

   output$download_qmesc <- downloadHandler(
    filename = function(){
     "myfile.Rnw"
    },
    content = function(file) {
     write(captureqmesc(),file) 
    }
   )

   #+++++++ Questão do tipo associativa +++++++++
   output$textAassoUI <- renderUI({
    textAreaInput("titlequestionass", 
     label=h4(uiOutput("tquestaoaa4")),
     width="300px",
     height="100px",
     value = tr("quesasso"))
   })

   output$radioassoUI <- renderUI({ 
    radioButtons("figass",
     label = h4(uiOutput("tfigura4")),
     choices = bsimm(), 
     selected = 2)
   })

   counterqasscondi <- reactiveValues(n = 2)

   observeEvent(input$add_btnqacond, {counterqasscondi$n <- counterqasscondi$n + 1})
   observeEvent(input$rm_btnqacond, {
    if (counterqasscondi$n > 2) counterqasscondi$n <- counterqasscondi$n - 1
   })

   output$qasscondiUI <- renderUI({
    n <- counterqasscondi$n 

    if(n > 2){
     lapply(seq_len(n), function(i) {
      tagList(
       tags$style(type="text/css",paste0("#condi1{margin-top:0px} #condi2{margin-top:-30px} #condi",i,"{margin-top:-30px}")),
       textInput(inputId= paste0("condi",i),
	label="",
	value=paste0(i,")Discreta"),
	width="225px")
      )
     })
    }else{
     tagList(
      tags$style(type="text/css","#condi2{margin-top:-30px}"),
      textInput(inputId = "condi1",
       label="",
       width="225px",
       value=tr("condassod")),
      textInput(inputId = "condi2",
       label="",
       width="225px",
       value=tr("condassoc"))
     )
    }
   })

   counterqassalt <- reactiveValues(n = 2)

   observeEvent(input$add_btnqaalt, {counterqassalt$n <- counterqassalt$n + 1})
   observeEvent(input$rm_btnqaaltresp, {
    if(counterqassalt$n > 2) counterqassalt$n <- counterqassalt$n - 1
   })

   output$qassaltUI <- renderUI({
    n <- counterqassalt$n

    if(n > 2){
     lapply(seq_len(n), function(i) {
      tagList(
       tags$style(type="text/css",paste0("#altass1{margin-top:0px} #altass2{margin-top:-30px} #altass",i,"{margin-top:-30px}")),
       textInput(inputId = paste0("altass",i),
	label="",
	width="110px",
	value=paste0(letters[i],")Peso em kg"))
      )
     })
    }else{
     tagList(
      tags$style(type="text/css","#altass2{margin-top:-30px}"),
      textInput(inputId = "altass1",
       label="",
       width="110px",
       value=tr("assa")),
      textInput(inputId = "altass2",
       label="",
       width="110px",
       value=tr("assb"))
     )
    }
   })

   output$qassaltrespUI <- renderUI({
    n <- counterqassalt$n 

    if(n > 2){
     lapply(seq_len(n), function(i) {
      tagList(
       tags$style(type="text/css",paste0("#altassresp1{margin-top:0px} #altassresp2{margin-top:-30px} #altassresp",i,"{margin-top:-30px}")),
       numericInput(inputId = paste0("altassresp",i),
	label="",
	width="110px",
	value=2)
      )
     })
    }else{
     tagList(
      tags$style(type="text/css","#altassresp2{margin-top:-30px}"),
      numericInput(inputId = "altassresp1",
       label="",
       width="110px",
       value=2),
      numericInput(inputId = "altassresp2",
       label="",
       width="110px",
       value=1)
     )
    }
   })

   captureqassalt <- reactive({
    n <- counterqassalt$n
    nc <- counterqasscondi$n

    if(nc > 2){
     meiocondi <- NULL
     for(i in 1:nc){
      meiocondi[i] <- paste0("\n\\item ",input[[paste0("condi",i)]])
     }
     meiocondi <- paste0(meiocondi,collapse="")
    }else{
     meiocondi <- paste0("\n\\item ",input$condi1,"\n\\item ",input$condi2)
    }

    if(n > 2){

     ini <- '<<echo=FALSE,results=hide>>=\nquestions <- solutions <- NULL'

     meio <- NULL
     for(i in 1:n){
      meio[i] <- paste0("\nquestions[",i,"] <- '",
       input[[paste0("altass", i)]],
       "' \nsolutions[",
       i,
       "] <- ",
       input[[paste0("altassresp",i)]])
     }

     meio2 <- paste0(meio,collapse='')

     fim <- paste0('\no <- sample(1:',n,')\nquestions <- questions[o]\nsolutions <- solutions[o]\n@')

     chunk <- paste0(ini,meio2,fim,collapse='')

     if(input$figass == 1){
      meioques <- paste0('\n\n\\begin{question}\n',
       input$titlequestionass, 
       '\n\n\\begin{figure}[H]\n\\centering\n\\includegraphics{',input$figureqass,'}\n\\end{figure}\n\n\\begin{enumerate}',
       meiocondi,
       '\n\\end{enumerate}
       \n\n\\begin{answerlist}')
     }else{
      meioques <- paste0('\n\n\\begin{question}\n',
       input$titlequestionass, 
       '\n\n\\begin{enumerate}\n',
       meiocondi,
       '\n\\end{enumerate}
       \n\n\\begin{answerlist}')
     } 

     meioquesans <- paste0(paste0('\n\\item \\Sexpr{questions[',1:n,']}'),collapse='')

     meioans <- '\n\\end{answerlist}\n\\end{question}  
     \n\\begin{solution} 
     \n\\begin{answerlist}'

     meioanssol <- paste0(paste0('\n\\item \\Sexpr{solutions[',1:n,']}'),collapse='')

     fim1 <- '\n\\end{answerlist}\n\\end{solution}
     \n\n%% META-INFORMATION\n%% \\extype{cloze}\n%% \\exsolution{\\Sexpr{paste(solutions,collaps"|")}}\n'

     fim2 <- paste0('%% \\exclozetype{',paste(rep('num',n),collapse="|"),'}')

     latex <- paste0(meioques,meioquesans,meioans,meioanssol,fim1,fim2,collapse='')

     paste0(chunk,latex)

    }else{
     ini <- '<<echo=FALSE,results=hide>>=\nquestions <- solutions <- NULL'

     meio <- paste0("\nquestions[1] <- '",
      input$altass1,
      "'\nsolutions[1] <- ",
      input$altassresp1,
      "\nquestions[2] <- '",
      input$altass2,
      "'\nsolutions[2] <- ",
      input$altassresp2,
      collapse="")

     fim <- paste0('\no <- sample(1:2)\nquestions <- questions[o]\nsolutions <- solutions[o]\n@')

     chunk <- paste0(ini,meio,fim,collapse='')

     if(input$figass == 1){
      meio <- paste0('\n\n\\begin{figure}[H]\n\\centering\n\\includegraphics{',
       input$figureqass,'}\n\\end{figure}')
     }else{
      meio <- ''
     } 

     latex <- paste0('\n\n\\begin{question}\n',
      input$titlequestionass,
      meio,
      '\n\n\\begin{enumerate}',
      meiocondi,
      '\n\\end{enumerate}\n\n\\begin{answerlit}\n\\item \\Sexpr{questions[1]}\n\\item \\Sexpr{questions[2]}\n\\end{answerlist}\n\\end{question}\n\n\\begin{solution}\n\\begin{answerlist}\n\\item \\Sexpr{solutions[1]}\n\\item \\Sexpr{solutions[2]}\n\\end{answerlist}\n\\end{solution}\n\n%% META-INFORMATION\n%% \\extype{cloze}\n%% \\exsolution{\\Sexpr{paste(solutions,collapse="|")}}\n%% \\exclozetype{num|num}')

     paste0(chunk,latex)
    }
   })

      output$download_qass <- downloadHandler(
       filename = function(){
	"myfile.Rnw"
       },
       content = function(file) {
	write(captureqassalt(),file) 
       }
      )

      #+++++++++++ Questão do tipo mista +++++++++++++#
     output$textAmistaUI <- renderUI({
      textAreaInput("titlequestionmist", 
     label=h4(uiOutput("tquestaoaa5")),
     width="300px",
     height="100px",
     value = tr("quesmista"))
     })
     
      output$radiomistaUI <- renderUI({
       radioButtons("figmist",
	label = h4(uiOutput("tfigura5")),
	choices = bsimm(), 
	selected = 2)
      })

      counterqmist <- reactiveValues(n = 2)

      observeEvent(input$add_btnqmist, {counterqmist$n <- counterqmist$n + 1})
      observeEvent(input$rm_btnqmistresp, {
       if (counterqmist$n > 2) counterqmist$n <- counterqmist$n - 1
      })

      output$qmistUI <- renderUI({
       n <- counterqmist$n 

       if(n > 2){
	lapply(seq_len(n), function(i) {
	 tagList(
	  tags$style(type="text/css",paste0("#altmist1{margin-top:0px} #altmist2{margin-top:-30px} #altmist",i,"{margin-top:-30px}")),
	  textInput(inputId = paste0("altmist",i),
	   label="",
	   width="110px",
	   value=paste0(letters[i],")Quais medidas de tendência central coincidem?"))
	 )
	})
       }else{
	tagList(
	 tags$style(type="text/css","#altmist2{margin-top:-30px}"),
	 textInput(inputId = "altmist1",
	  label="",
	  width="110px",
	  value=tr("altmista")),
	 textInput(inputId = "altmist2",
	  label="",
	  width="110px",
	  value=tr("altmistb"))
	)
       }
      })

      output$qmistrespUI <- renderUI({
       n <- counterqmist$n 

       if(n > 2){
	lapply(seq_len(n), function(i) {
	 tagList(
	  tags$style(type="text/css",paste0("#altmistresp1{margin-top:0px} #altmistresp2{margin-top:-30px} #altmistresp",i,"{margin-top:-30px}")),
	  textInput(inputId = paste0("altmistresp",i),
	   label="",
	   width="110px",
	   value="Média e mediana.")
	 )
	})
       }else{
	tagList(
	 tags$style(type="text/css","#altmistresp2{margin-top:-30px}"),
	 textInput(inputId = "altmistresp1",
	  label="",
	  width="110px",
	  value=tr("respmista")),
	 textInput(inputId = "altmistresp2",
	  label="",
	  width="110px",
	  value="6")
	)
       }
      })

      captureqmisto <- reactive({
       n <- counterqmist$n

       if(n > 2){

	ini <- '<<echo=FALSE,results=hide>>=\nquestions <- solutions <- NULL'

	meio <- NULL
	type <- NULL

	for(i in 1:n){
	 type[i] <- suppressWarnings(as.numeric(input[[paste0("altmistresp",i)]]))
	 type[i] <- ifelse(is.na(type[i]),"string","num")

	 meio[i] <- paste0("\nquestions[",i,"] <- '",
	  input[[paste0("altmist", i)]],
	  "' \nsolutions[",
	  i,
	  ifelse(type[i]=="string", "] <- '","] <- "),
	  input[[paste0("altmistresp",i)]],
	  ifelse(type[i]=="string","'","")
	 )
	}

	meio2 <- paste0(meio,collapse='')

	fim <-'\n@'

	chunk <- paste0(ini,meio2,fim,collapse='')

	if(input$figmist == 1){
	 meioques <- paste0('\n\n\\begin{question}\n',
	  input$titlequestionmist, 
	  '\n\n\\begin{figure}[H]\n\\centering\n\\includegraphics{',input$figureqmist,'}\n\\end{figure}
	  \n\n\\begin{answerlist}')
	}else{
	 meioques <- paste0('\n\n\\begin{question}\n',
	  input$titlequestionmist, 
	  '\n\n\\begin{answerlist}')
	} 

	meioquesans <- paste0(paste0('\n\\item \\Sexpr{questions[',1:n,']}'),collapse='')

	meioans <- '\n\\end{answerlist}\n\\end{question}  
	\n\\begin{solution} 
	\n\\begin{answerlist}'

	meioanssol <- paste0(paste0('\n\\item \\Sexpr{solutions[',1:n,']}'),collapse='')

	fim1 <- '\n\\end{answerlist}\n\\end{solution}
	\n\n%% META-INFORMATION\n%% \\extype{cloze}\n%% \\exsolution{\\Sexpr{paste(solutions,collaps"|")}}\n'

	fim2 <- paste0('%% \\exclozetype{',paste(type,collapse="|"),'}')

	latex <- paste0(meioques,meioquesans,meioans,meioanssol,fim1,fim2,collapse='')

	paste0(chunk,latex)

       }else{
	ini <- '<<echo=FALSE,results=hide>>=\nquestions <- solutions <- NULL'

	type <- c(suppressWarnings(as.numeric(input$altmistresp1)),suppressWarnings(as.numeric(input$altmistresp2)))
	type <- sapply(type,function(x)ifelse(is.na(x),'string','num'))

	meiosol <- fimsol <- NULL
	for(i in 1:2){
	 meiosol[i] <- ifelse(type[i]=='string',
	  paste0("\nsolutions[",i,"] <- '"),
	  paste0("\nsolutions[",i,"] <- "))
	 fimsol[i] <- ifelse(type[i]=='string',
	  "'",
	  "")
	}

	meio <- paste0("\nquestions[1] <- '",
	 input$altmist1,"'",
	 meiosol[1], 
	 input$altmistresp1,
	 fimsol[1],	
	 "\nquestion[2] <- '",
	 input$altmist2,"'",
	 meiosol[2],
	 input$altmistresp2,
	 fimsol[2], 
	 "\n@",
	 collapse="")

	chunk <- paste0(ini,meio)

	if(input$figmist == 1){
	 meioques <- paste0('\n\n\\begin{question}\n',
	  input$titlequestionmist, 
	  '\n\n\\begin{figure}[H]\n\\centering\n\\includegraphics{',input$figureqmist,'}\n\\end{figure}
	  \n\n\\begin{answerlist}')
	}else{
	 meioques <- paste0('\n\n\\begin{question}\n',
	  input$titlequestionmist, 
	  '\n\n\\begin{answerlist}')
	} 

	meioquesans <- paste0(paste0('\n\\item \\Sexpr{questions[',1:2,']}'),collapse='')

	meioans <- '\n\\end{answerlist}\n\\end{question}  
	\n\\begin{solution} 
	\n\\begin{answerlist}'

	meioanssol <- paste0(paste0('\n\\item \\Sexpr{solutions[',1:2,']}'),collapse='')

	fim1 <- '\n\\end{answerlist}\n\\end{solution}
	\n\n%% META-INFORMATION\n%% \\extype{cloze}\n%% \\exsolution{\\Sexpr{paste(solutions,collaps"|")}}\n'

	fim2 <- paste0('%% \\exclozetype{',paste(type,collapse="|"),'}')

	latex <- paste0(meioques,meioquesans,meioans,meioanssol,fim1,fim2,collapse='')

	paste0(chunk,latex)
       }
      })

	 output$download_qmist <- downloadHandler(
	  filename = function(){
	   "myfile.Rnw"
	  },
	  content = function(file) {
	   write(captureqmisto(),file) 
	  }
	 )
