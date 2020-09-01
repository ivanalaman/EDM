#+++++++ Checando a versão no repositório +++++++#

observeEvent(input$upp_app,{

 versionnew <- reactive({
  repos <- readLines("https://github.com/ivanalaman/EDM/blob/master/DESCRIPTION")
  posver <- grep("Version",repos)
  versionsujo <- repos[posver]
  versionlimpo <- sub("<td[^>]*>","",versionsujo)
  versionlimpo2 <- sub("<\\/td>","",versionlimpo)
  versionnew <- sub("\\D*","",versionlimpo2)
  versionnew
 })

 #+++++++ Checando a versão instalada ++++++++++#
 versionold <- reactive({
  packageVersion("EDM")
 })

 if(versionold() == versionnew()){
  #Dispara um pop-up
  showModal(modalDialog(
    title = "",
    uiOutput("mversaoatu"),
    footer = tagList(
     modalButton("Ok!")
    )
    ))
 }else{
  #Dispara um pop-up dizendo a versão atual e a versão disponível e perguntando se gostaria de atualizar a atual versão

  showModal(modalDialog(
    title = "",
    uiOutput("matualiapp"),
    footer = tagList(
     modalButton(uiOutput("bnao")),
     actionButton("ok",uiOutput("bsim"))
    )
    ))
 }
})

observeEvent(input$ok, {

 withProgress(message = tr("mgbase"), min=1,max=30,{
  Sys.sleep(1)
  #Agora começa-se o procedimento de atualização
  pathlibraries <- .libPaths()
  setwd(pathlibraries)#Este comando foi necessário, pois ao atualizar o app removendo o pacote, o diretório fica inexistente, gerando um erro do tiop getwcd() failed: No such file or directory. 

  #filetemp <- tempfile()
  #download.file(url = "https://github.com/ivanalaman/EDM/archive/master.zip",destfile = filetemp)
  #unzip(filetemp,exdir=tempdir())
  #unlink(paste0(tempdir(),"/EDM-master/inst/questionbank"),recursive=TRUE)

  pathEDM <- find.package("EDM")#encontrando o diretório do EDM
  pathqbank <- paste0(pathEDM,"/questionbank")#fazendo o caminho do banco de questões
  pathwidgets <- paste0(pathEDM,"/aux_files")#fazendo o caminho para os widgets com o intuito de garantir que o banco de questões do usuário seja reconhecido após a atualização
  copysecure <- file.copy(from=pathqbank,to=tempdir(),recursive=TRUE)#copiando o banco de questões do usuário para um local seguro
  copysecurewid <- file.copy(from=pathwidgets,to=tempdir(),recursive=TRUE)#copiando o widgets antigo do usuário para um local seguro 

  remove.packages("EDM") #removendo o pacote EDM desatualizado!
  devtools::install_github("ivanalaman/EDM",upgrade="never",force=TRUE) #instalando nova versão!
  file.copy(from=paste0(tempdir(),"/questionbank"),to=pathEDM,recursive=TRUE)#copiando o banco de questões do usuário de volta para o pacote
  file.copy(from=paste0(tempdir(),"/aux_files/widgets"),to=paste0(pathEDM,"/aux_files"),recursive=TRUE)#copiando o widgets do usuário de volta para o pacote
  file.copy(from=paste0(tempdir(),"/aux_files/.who.txt"),to=paste0(pathEDM,"/aux_files"),recursive=TRUE)#copiando o arquivo que grava a informação o último banco de dados que foi criado  pelo usuário

  stopApp()
  showModal(modalDialog(
    title = "",
    tr("mreiniciar"),
    footer = modalButton("OK!"),
    size='m'))
 })
})

