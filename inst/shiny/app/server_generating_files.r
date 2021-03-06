getid <- reactive({

  function(i) paste('Av', 
   gsub(' ','0',
    format(i, width=2)),sep='')
 })

ostype <- reactive({
 
 ifelse(.Platform$OS.type=="unix",
  ost <- "/EDM",
  ost <- "\\EDM")
})

#expdf <- eventReactive(input$downloadPDF,{
observeEvent(input$downloadPDF,{ 
 withProgress(message = tr("mgerfiles"),min=0,max=30,{
  Sys.sleep(1)

 res <- try(exams2pdf(questions(),
   n = input$numquestion,
   template = c('../../template/avaliacao.tex',
    '../../template/solucao.tex'),
   header = list(ID=getid(),Date=Sys.Date()),
   name = c('av','av.gab'),
   dir = paste(Sys.getenv('HOME'),'/EDM',sep=''),
   inputs = file.path(sub('shiny/app','sup',getwd()),c("aval.tex",
     "unid.tex",
     "disc.tex",
     "carg.tex",
     "anol.tex",
     "nome.tex")),
   encoding = "UTF-8"),silent = TRUE)

  if("try-error"%in% class(res)){
   showModal(modalDialog(
     title = uiOutput("tirefreshapp"),
     paste0(tr("merrorpdf1"),attr(res,"condition")[[1]],".",tr("merrorpdf2")),
     footer = modalButton("OK!"),
     size='m'
     )) 
  }else{
  showModal(modalDialog(
    title = uiOutput("tirefreshapp"),
    paste0(tr("meresavedfiles"),' ',Sys.getenv("HOME"),ostype()),
    footer = modalButton("OK!"),
    size='m'
    )) 
  }
  })
})

observeEvent(input$downloadXML,{ 
 withProgress(min=0,max=30,{
  Sys.sleep(1)

  exams2moodle(questions(),
   n = input$numquestion,
   dir = paste(Sys.getenv('HOME'),'/EDM',sep=''), 
   encoding = "UTF-8")

  showModal(modalDialog(
    title = uiOutput("tirefreshapp"),
    paste0(tr("meresavedfiles"),Sys.getenv("HOME"),ostype()),
    footer = modalButton("OK!"),
    size='m'
    )) 
   })
 })

 output$downloadQuestions <- downloadHandler(
  filename = function() {
   paste("questions", "zip", sep=".")
  },
  content = function(file) {
   fs <- NULL
   for (i in 1:length(questions())) {
    fs[i] <- questions()[i]
   }
   zip(zipfile=file, files=fs)
  },
  contentType = "application/zip"
 )

observeEvent(input$select_button, {
               #print(see_questions()[[selectedRow]])
               #+++++++++++++ Visualizing questions ++++++++++++++#
               source("server_visualize_questions.r",local = TRUE)$value

               res <- try(exams2html(see_questions(),
                                     encoding = 'UTF-8'),silent=TRUE)

               if("try-error"%in% class(res)){
                 showModal(modalDialog(
                                       title = uiOutput("tirefreshapp"),
                                       paste0(tr("merrorhtml1"),attr(res,"condition")[[1]],".",tr("merrorpdf2")),
                                       footer = modalButton("OK!"),
                                       size='m'
                                       )) 
               }
 })


