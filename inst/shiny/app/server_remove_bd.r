output$removee <- renderUI({

 if(length(dirs()) == 1) {
  helpText(h2(tr("mrbanco")))
 } else {
  source('../../aux_files/widgets/current/remove_widgets.r',local=TRUE)$value 
 }
})

observe({
 shinyjs::toggleState("removerb", length(dirs())!=1)
})

observeEvent(input$removerb, {

 withProgress(message = tr("mgbase"), min=1,max=30, {
  Sys.sleep(1) 

  aux_rem  <- list.dirss(path='../../questionbank/')
  aux_rem1 <- list.dirss(path=paste('../../questionbank/',
    aux_rem,
    sep=''))

  aux_rem11 <- paste('../../questionbank/',
   aux_rem,
   '/',
   aux_rem1,
   sep='')
  names(aux_rem11) <- aux_rem1
  aux_rem11 <- aux_rem11[names(aux_rem11)!='ACZ']

  siglasr   <- tolower(aux_rem1[aux_rem1!='ACZ'])

  aux_siglasr <- paste('input$checkquestionr',siglasr,sep='')
  aux_siglas1r <- unlist(sapply(aux_siglasr, function(x) eval(parse(text=x))))

  aux_grepp <- siglasr[aux_siglas1r]

  aux_grepp1 <-  aux_rem11[names(aux_rem11)==toupper(aux_grepp)]

  unlink(aux_grepp1,
   recursive = TRUE)

  aux_ch <- mgsub(paste('/',
    toupper(aux_grepp),
    sep=''),
   rep('',length(aux_grepp)),
   aux_grepp1) 

  aux_ch1 <- lapply(sapply(aux_ch,dir),
   length)

  aux_ch2 <- unlist(aux_ch1)

  if(any(aux_ch2 == 0)){

   aux <- aux_ch2[aux_ch2==0]

   aux1 <- aux_ch[names(aux_ch)==names(aux)]

   unlink(aux1,
    recursive = TRUE)

  }

  # +++++++++++ Removendo no arquivo question_teacher.r ++++++++++++++

  aux_quest  <- file('../../aux_files/widgets/current/question_teacher.r','r+')
  on.exit(close(aux_quest)) 
  aux_quest1 <- readLines(aux_quest)
  aux_quest2 <- sapply(aux_grepp,function(x) grep(x,aux_quest1),simplify=FALSE)
  aux_quest3 <- lapply(aux_quest2, function(x) x[c(1,5)] + c(-1,+2))
  aux_quest4 <- lapply(aux_quest3,function(x)paste(x,collapse=':'))
  aux_quest5 <- paste('c(',paste(aux_quest4,collapse=','),')',sep='')
  aux_quest6 <- aux_quest1[-eval(parse(text=aux_quest5))]

  fqt6 <- '../../aux_files/widgets/current/question_teacher.r'
  cat(aux_quest6,file=fqt6,sep='\n')
  
  # +++++++++++ Removendo no arquivo widgets.r ++++++++++++++

  aux_widgg  <- file('../../aux_files/widgets/current/widgets.r','r+')
  on.exit(close(aux_widgg)) 
  aux_widgg1 <- readLines(aux_widgg)
  aux_widgg2 <- sapply(aux_grepp,function(x) grep(x,aux_widgg1),simplify=FALSE)
  aux_widgg3 <- lapply(aux_widgg2, function(x) x[c(1,3)] + c(-1,+2))
  aux_widgg4 <- lapply(aux_widgg3,function(x)paste(x,collapse=':'))
  aux_widgg5 <- paste('c(',paste(aux_widgg4,collapse=','),')',sep='')
  aux_widgg6 <- aux_widgg1[-eval(parse(text=aux_widgg5))]

  if(aux_widgg6[length(aux_widgg6)] == ',') {

   aux_widgg6[length(aux_widgg6)]  <- ')' 

  }

  fw6 <- '../../aux_files/widgets/current/widgets.r'
  cat(aux_widgg6,file=fw6,sep='\n')

  # +++++++++++ Removendo no arquivo remove_widgets.r ++++++++++++++

  aux_widgr  <- file('../../aux_files/widgets/current/remove_widgets.r','r+')
  on.exit(close(aux_widgr)) 
  aux_widgr1 <- readLines(aux_widgr)
  aux_widgr2 <- sapply(aux_grepp,function(x) grep(x,aux_widgr1),simplify=FALSE)
  aux_widgr3 <- lapply(aux_widgr2, function(x) x[1] - 1)
  aux_widgr4 <- lapply(aux_widgr3,function(x)paste(x,x+4,sep=':'))
  aux_widgr5 <- paste('c(',paste(aux_widgr4,collapse=','),')',sep='')
  aux_widgr6 <- aux_widgr1[-eval(parse(text=aux_widgr5))]

  if(length(aux_widgr6) == 1) {

   aux_aux <- file('../../aux_files/widgets/mirror/remove_widgets_default.r','r+')
   on.exit(close(aux_aux)) 
   aux_aux1 <- readLines(aux_aux)
   aux_aux2 <- append(aux_aux1,
    'tagList(',
    0)
   aux_widgr6 <- append(aux_aux2,
    ')',
    6)

  }

  if(aux_widgr6[length(aux_widgr6)] == ',') {

   aux_widgr6[length(aux_widgr6)]  <- ')'

  }

  fr6 <- '../../aux_files/widgets/current/remove_widgets.r'
  cat(aux_widgr6,file=fr6,sep='\n')

  file.remove('../../aux_files/.who.txt')

  showModal(modalDialog(
    title = uiOutput("tirefreshapp"),
    uiOutput("merefreshapp"),
    footer = tagList(
     actionButton('closeremovebd',"Ok!")
     ),
    size='m'
    )) 

  observeEvent(input$closeremovebd,{
   stopApp()
   })

})
})
