dirs <- reactive({

 dirs <- list.dirss('../../questionbank')
 dirs

})

sdirs <- reactive({

 sdr <- list.dirss(list.dirss('../../questionbank',
   full.names=TRUE))
 sdr

})

dcountry <- reactive({

 dcountry <- read.table('../../aux_files/other/countries.txt',h=TRUE) 
 dcountry

})

output$ccountry <- renderUI({

 listcountry <- unique(as.character(dcountry()$country)) 

 selectInput('countries',
  label=h4(uiOutput("ncountry")),
  listcountry)

})

observeEvent(input$gerarb, {

 if(any(input$text == sdirs())) {

  shinyjs::info(tr("jtbase"))

  stopApp()

 } else {

  withProgress(message = tr("mgbase"), min=1,max=30, {
   Sys.sleep(1)

   auxass <- paste('../../questionbank/',
    input$countries,
    '/',
    input$text,
    '/',
    input$ydiscp,
    '/',
    input$yassun,
    sep='') 

   subsub <- c(tr("pdisc"),tr("pobj"))
   subsubsub <- c(tr("pnifa"),tr("pnme"),tr("pndif"))

   aux1 <- paste(auxass,
    '/',
    subsub,
    sep='')

   aux2 <- sapply(aux1,
    function(x)paste(x,
     subsubsub,
     sep='/'))

   lapply(aux2,function(x)sapply(x,function(y)dir.create(y,recursive=T)))

   namedir <- toupper(input$text)
   namefil <- tolower(namedir)

   namecou <- input$countries
   your_name <- input$yourname

   #             ++++++++++++++ Criando Widgets para o novo usuário ++++++++++++++++ #

   new_widget(namefil   = namefil,
    your_name = your_name)

   #             ++++++++++++++ Criando Question teacher para o novo usuário ++++++++++++++++ #

   new_questiont(namefil   = namefil, 
    your_name = your_name, 
    namedir   = namedir, 
    namecou   = namecou) 

   #             ++++++++++++++ Criando Widgets para remoção ++++++++++++++++ #

   new_remove_widgets(namefil   = namefil, 
    your_name = your_name) 

   #             +++++++++++++ Escrevendo o novo Widget completo para arquivo ui.r +++++++++++++ #

   nw <- '../../aux_files/widgets/temp/new_Widget.r'
   ow <- '../../aux_files/widgets/current/widgets.r'

   aux_ow <- file(ow,'r+') 
   on.exit(close(aux_ow))
   length_ow <- length(readLines(aux_ow))

   file.append(ow,nw)

   aux_ow1 <- file(ow,'r+')
   on.exit(close(aux_ow1))
   old_ow1 <- readLines(aux_ow1)
   old_ow1 <- old_ow1[-length_ow]
   new_ow <- append(old_ow1,')',after=length(old_ow1))
   cat(new_ow, file=ow,sep='\n')

   #             +++++++++++++ Escrevendo o novo Question teacher +++++++++++ #

   nqt <- '../../aux_files/widgets/temp/new_questiont.r'
   oqt <- '../../aux_files/widgets/current/question_teacher.r'

   file.append(oqt,nqt) 

   cat(tr("mdelete"),
    file=paste(aux2[1,1],
     '/teste1.Rnw',sep=''))  
   cat(tr("mdelete"),
    file=paste(aux2[1,2],
     '/teste2.Rnw',sep=''))
   cat(tr("mdelete"),
    file=paste(aux2[2,1],
     '/teste3.Rnw',sep=''))
   cat(tr("mdelete"),
    file=paste(aux2[2,2],
     '/teste4.Rnw',sep=''))
   cat(tr("mdelete"),
    file=paste(aux2[3,1],
     '/teste5.Rnw',sep=''))
   cat(tr("mdelete"),
    file=paste(aux2[3,2],
     '/teste6.Rnw',sep=''))

   #             +++++++++++++ Escrevendo o novo Widget de remoção +++++++++++++ #

   nwr <- '../../aux_files/widgets/temp/new_remove_widgets.r'
   owr <- '../../aux_files/widgets/current/remove_widgets.r'

   aux_owr <- file(owr,'r+') 
   on.exit(close(aux_owr))
   length_owr <- length(readLines(aux_owr))

   file.append(owr,nwr)

   aux_ow1r <- file(owr,'r+')
   on.exit(close(aux_ow1r))
   old_ow1r <- readLines(aux_ow1r)
   old_ow1r <- old_ow1r[-length_owr]
   new_owr <- append(old_ow1r,')',after=length(old_ow1r))

   aux_grep <- grep('acz',new_owr)

   if(length(aux_grep) != 0){

    new_owr <- new_owr[-c(2:6)]

   }

   cat(new_owr, file=owr,sep='\n')

   # +++++++++++++ Escrevendo um arquivo oculto que conterará o nome do banco criado +++++++++++++ # 
   cat(paste(namecou,
     '/',
     namedir,
     sep=''),
    file='../../aux_files/.who.txt',
    sep='\n')

   showModal(modalDialog(
     title = uiOutput("tirefreshapp"),
     uiOutput("merefreshapp"),
     footer = tagList(
      actionButton('closecreatebd',"Ok!")
      ),
     size='m'
     )) 

   observeEvent(input$closecreatebd,{
    stopApp()
   })

  })
 }
})

listad <- reactive({

 aux_lista <- paste("'",
  dirs(),
  "'='",
  tolower(dirs()),
  "'",
  sep='',
  collapse=',')
 lista <- paste('list(',
  aux_lista,
  ')',
  sep='')
 lista
})
