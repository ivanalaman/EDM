observeEvent(input$atubanco,{

 ori <- getwd()

 whereEDM <- find.package('EDM')
 wheredata <- paste(whereEDM,
  '/questionbank/',
  sep="")

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

 bfiless <- list.dirss(afiless,
  full.names = TRUE)

 dfiless <- bfiless[bfiless!=paste(tempdir(),
  '/questionbankEDM-master/austria/ACZ',
  sep='')]

#################
#EU PRECISO PREPARAR UM SCRIPT QUE CHECA SE A VERSÃO BAIXADA DO REPOSITÓRIO CONTÉM NOVIDADES/AUTUALIZAÇÕES COMPARADO AO BANCO DE QUESTÕES ATUAL DO USUÁRIO. CASO NÃO HAJA ATUALIZAÇÕES, ENTÃO CRIA-SE UM modalDialog ou outro artifífico e encerra-se o procedimento. Caso contrário, continua-se o procedimento para atualizar o banco de questões.
################

 # preparando objetos para fazer os widgets
 info_banco <- file(paste(tempdir(),
   '/questionbankEDM-master/CADASTRO.md',
   sep=''),
  'r+') 
 on.exit(close(info_banco))
 info_banco1 <- readLines(info_banco)
 info_banco2 <- info_banco1[-c(1:4)]

 aux_ncou <- info_banco2[seq(1,length(info_banco2),3)]
 ncou <- mgsub("\\W",
  "",
  aux_ncou)

 aux_dir <- info_banco2[seq(2,length(info_banco2),3)]
 rdir <- regexec("([A-Z]{3})",aux_dir)
 ndir <- unique(unlist(regmatches(aux_dir,rdir)))

 nnames <- mgsub("(?:\\s+\\*\\s+[A-Z]{3}\\s-\\s)",
  "",
  aux_dir)

 bc <- cbind(ncou, nnames)
 row.names(bc) <- ndir

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

  efiless <- dfiless[dfiless!=paste(tempdir(),
   '/questionbankEDM-master/',
   who1,
   sep='')]

  filess <- mgsub('\\/[A-Z]{3}$',
   '',
   efiless,
   perl=TRUE)

  file.copy(from= filess,
   to = wheredata,
   recursive=TRUE,
   copy.mode=TRUE)

  # preparando objetos para entrada abaixo

  ifelse(any(row.names(bc) == whodir),
   bc1 <- bc[row.names(bc)!= whodir,],
   bc1 <- bc
  )

  namefil <- tolower(row.names(bc1))
  your_name <- bc1[,2]
  namedir <- row.names(bc1)
  namecou <- bc1[,1]

  #             ++++++++++++++ Criando Widgets para os bancos ++++++++++++++++ #

  setwd(ori)

  for(i in 1:length(namedir)){

   new_widget(namefil   = namefil[i],
    your_name = your_name[i])

   #             ++++++++++++++ Criando Question teacher para os bancos ++++++++++++++++ #

   new_questiont(namefil   = namefil[i], 
    your_name = your_name[i], 
    namedir   = namedir[i], 
    namecou   = namecou[i]) 

   #             ++++++++++++++ Criando Widgets para remoção ++++++++++++++++ #

   new_remove_widgets(namefil   = namefil[i], 
    your_name = your_name[i]) 
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

  #             +++++++++++++ Escrevendo o novo Question teacher +++++++++++ #

  nqt <- '../../aux_files/widgets/temp/new_questiont.r'
  oqt <- '../../aux_files/widgets/current/question_teacher.r'

  file.append(oqt,nqt) 

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

 } else {

  filess <- mgsub('\\/[A-Z]{3}$',
   '',
   dfiless,
   perl=TRUE) 

  file.copy(from= filess,
   to = wheredata,
   recursive=TRUE,
   copy.mode=TRUE)

  # preparando objetos para entrada abaixo

  namefil <- tolower(row.names(bc))
  your_name <- bc[,2]
  namedir <- row.names(bc)
  namecou <- bc[,1]

  #             ++++++++++++++ Criando Widgets para os bancos ++++++++++++++++ #

  setwd(ori)

  for(i in 1:length(namedir)){

   new_widget(namefil   = namefil[i],
    your_name = your_name[i])

   #             ++++++++++++++ Criando Question teacher para os bancos ++++++++++++++++ #

   new_questiont(namefil   = namefil[i], 
    your_name = your_name[i], 
    namedir   = namedir[i], 
    namecou   = namecou[i]) 

   #             ++++++++++++++ Criando Widgets para remoção ++++++++++++++++ #

   new_remove_widgets(namefil   = namefil[i], 
    your_name = your_name[i]) 
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

  #             +++++++++++++ Escrevendo o novo Question teacher +++++++++++ #

  nqt <- '../../aux_files/widgets/temp/new_questiont.r'
  oqt <- '../../aux_files/widgets/current/question_teacher.r'

  file.append(oqt,nqt) 

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

 }

 stopApp()
 showModal(modalDialog(
   title = "",
   tr("mreiniciar"),
   footer = modalButton("OK!"),
   size='m'))

}
)
