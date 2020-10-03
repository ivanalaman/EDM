observeEvent(input$atubanco,{
  withProgress(message = tr("mgbase"), min=1,max=30, {
   Sys.sleep(1)
   
 ori <- getwd()
 
 whereEDM <- find.package('EDM')
 wheredata <- paste(whereEDM,
  '/questionbank/',
  sep="")

 newori <- paste0(whereEDM,'/shiny/app/')

 download.file("https://github.com/ivanalaman/questionbankEDM/archive/master.zip",
  destfile= paste(tempdir(),
   '/master.zip',
   sep=''),
  method='auto')

 unzip(paste(tempdir(),
   '/master.zip',
   sep=''),
  exdir = tempdir())

 afiless <- list.dirss(paste(tempdir(),
   '/questionbankEDM-master',
   sep=''),
  full.names = TRUE)
 
 bfiless <- afiless[afiless!=paste(tempdir(),
  '/questionbankEDM-master/inst',
  sep='')]

 cfiless <- paste0(bfiless,'/.')
  
 # preparando objetos para fazer os widgets
 info_banco <- file(paste(tempdir(),
   '/questionbankEDM-master/CADASTRO.md',
   sep=''),
  'r+') 
 on.exit(close(info_banco))
 info_banco1 <- suppressWarnings(readLines(info_banco))
 info_banco2 <- info_banco1[-c(1:6)]

 sepinfor <- sapply(info_banco2,function(x)strsplit(x,'\\|'))
 #sepinforlimpo <- sapply(sepinfor,function(x)gsub("\\s","",x))
 tabinfor <- do.call('rbind',sepinfor)
 rownames(tabinfor) <- NULL
 tabinforlimpo <- tabinfor[,-c(1,5:6)]
 tabinforlimpo1 <- apply(tabinforlimpo,2,function(x)gsub("^\\s","",x))
 tabinforlimpo2 <- apply(tabinforlimpo1,2,function(x)gsub("(\\s)*$","",x))
# aux_ncou <- info_banco2[seq(1,length(info_banco2),3)]
# ncou <- mgsub("\\W",
#  "",
#  aux_ncou)
#
# aux_dir <- info_banco2[seq(2,length(info_banco2),3)]
# rdir <- regexec("([A-Z]{3})",aux_dir)
# ndir <- unique(unlist(regmatches(aux_dir,rdir)))
#
# nnames <- mgsub("(?:\\s+\\*\\s+[A-Z]{3}\\s-\\s)",
#  "",
#  aux_dir)
#
# bc <- cbind(ncou, nnames)
# row.names(bc) <- ndir


 setwd(newori)
 ### condição: ou o usuário criou um banco de questões ou não!
 if(file.exists(paste(whereEDM,
    '/aux_files/.who.txt',
    sep=''))){

  who <- file(paste(whereEDM,
    '/aux_files/.who.txt',
    sep=''),'r+') 
  on.exit(close(who))
  who1 <- readLines(who)

  whodir <- gsub('\\w+\\/',
   '',
   who1)

  rmfileintemp <- paste0(tempdir(),'/questionbankEDM-master/questionbank/',
  who1)
 
  unlink(rmfileintemp,
         recursive = TRUE)
  
  efiless <- list.dirss(paste0(tempdir(),
  '/questionbankEDM-master/questionbank/'),
  full.names = TRUE)

  file.copy(from= efiless,
   to = wheredata,
   overwrite = TRUE,
   recursive = TRUE,
   copy.mode = TRUE)

  # preparando objetos para entrada abaixo
    poswho <- which(tabinforlimpo2[,3] == whodir)
  ifelse(any(tabinforlimpo2[,3] == whodir),
   bc1 <- matrix(tabinforlimpo2[-c(poswho),],ncol=3),
   bc1 <- tabinforlimpo2 
  )

  namefil <- tolower(bc1[,3])
  your_name <- bc1[,2]
  namedir <- bc1[,3]
  namecou <- bc1[,1]

  #             ++++++++++++++ Criando Widgets para os bancos ++++++++++++++++ #
  for(i in 1:length(namedir)){

   new_widget(namefil   = namefil[i],
    your_name = your_name[i],i=i)
 
   #             ++++++++++++++ Criando Question teacher para os bancos ++++++++++++++++ #

   new_questiont(namefil   = namefil[i], 
    your_name = your_name[i], 
    namedir   = namedir[i], 
    namecou   = namecou[i],i=i) 

   #             ++++++++++++++ Criando Widgets para remoção ++++++++++++++++ #

   new_remove_widgets(namefil   = namefil[i], 
    your_name = your_name[i],i=i) 
  }

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
  
  # $$$$$ Corrigindo os arquivos na pasta temp que ficou bugado devido ao loop
  file.remove(nw)
  file.copy(from='../../aux_files/widgets/mirror/widgets_default.r',to='../../aux_files/widgets/temp/')
  file.rename(from='../../aux_files/widgets/temp/widgets_default.r',to='../../aux_files/widgets/temp/new_Widget.r')
  
  #             +++++++++++++ Escrevendo o novo Question teacher +++++++++++ #

  nqt <- '../../aux_files/widgets/temp/new_questiont.r'
  oqt <- '../../aux_files/widgets/current/question_teacher.r'

  file.append(oqt,nqt) 

  # $$$$$ Corrigindo os arquivos na pasta temp que ficou bugado devido ao loop
  file.remove(nqt)
  file.copy(from='../../aux_files/widgets/mirror/question_teacher_default.r',to='../../aux_files/widgets/temp/')
  file.rename(from='../../aux_files/widgets/temp/question_teacher_default.r',to='../../aux_files/widgets/temp/new_questiont.r')

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
  
  # $$$$$ Corrigindo os arquivos na pasta temp que ficou bugado devido ao loop
  file.remove(nwr)
  file.copy(from='../../aux_files/widgets/mirror/remove_widgets_default.r',to='../../aux_files/widgets/temp/')
  file.rename(from='../../aux_files/widgets/temp/remove_widgets_default.r',to='../../aux_files/widgets/temp/new_remove_widgets.r')

 } else {

   file.copy(from= cfiless,
   to = wheredata,
   recursive=TRUE,
   copy.mode=TRUE)

  # preparando objetos para entrada abaixo

  namefil <- tolower(tabinforlimpo2[,3])
  your_name <- tabinforlimpo2[,2]
  namedir <- tabinforlimpo2[,3]
  namecou <- tabinforlimpo2[,1]

  #             ++++++++++++++ Criando Widgets para os bancos ++++++++++++++++ #  
  for(i in 1:length(namedir)){

   new_widget(namefil   = namefil[i],
    your_name = your_name[i],i=i)

   #             ++++++++++++++ Criando Question teacher para os bancos ++++++++++++++++ #
    
   new_questiont(namefil   = namefil[i], 
    your_name = your_name[i], 
    namedir   = namedir[i], 
    namecou   = namecou[i], i=i) 

   #             ++++++++++++++ Criando Widgets para remoção ++++++++++++++++ #

   new_remove_widgets(namefil   = namefil[i], 
    your_name = your_name[i],i=i) 
  
 }
 
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
  
  # $$$$$ Corrigindo os arquivos na pasta temp que ficou bugado devido ao loop
  file.remove(nw)
  file.copy(from='../../aux_files/widgets/mirror/widgets_default.r',to='../../aux_files/widgets/temp/')
  file.rename(from='../../aux_files/widgets/temp/widgets_default.r',to='../../aux_files/widgets/temp/new_Widget.r')
  
  #             +++++++++++++ Escrevendo o novo Question teacher +++++++++++ #

  nqt <- '../../aux_files/widgets/temp/new_questiont.r'
  oqt <- '../../aux_files/widgets/current/question_teacher.r'

  file.append(oqt,nqt) 

  # $$$$$ Corrigindo os arquivos na pasta temp que ficou bugado devido ao loop
  file.remove(nqt)
  file.copy(from='../../aux_files/widgets/mirror/question_teacher_default.r',to='../../aux_files/widgets/temp/')
  file.rename(from='../../aux_files/widgets/temp/question_teacher_default.r',to='../../aux_files/widgets/temp/new_questiont.r')
 
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
 
 # $$$$$ Corrigindo os arquivos na pasta temp que ficou bugado devido ao loop
 file.remove(nwr)
 file.copy(from='../../aux_files/widgets/mirror/remove_widgets_default.r',to='../../aux_files/widgets/temp/')
 file.rename(from='../../aux_files/widgets/temp/remove_widgets_default.r',to='../../aux_files/widgets/temp/new_remove_widgets.r')
 }

 showModal(modalDialog(
   title =  uiOutput("tirefreshapp"),
    uiOutput("merefreshapp"),
   footer = tagList(
      actionButton('closecreatebdup',"Ok!")
      ),
   size='m'))

   setwd(ori) 
   observeEvent(input$closecreatebdup,{
    stopApp()
   })
   
 })
}
)
