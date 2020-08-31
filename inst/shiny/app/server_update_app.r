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
    "Versão atualizada!"))
 }else{
  #Dispara um pop-up dizendo a versão atual e a versão disponível e perguntando se gostaria de atualizar a atual versão

  modalDialog(
   title = "",
   "Sua versão está desatualizada!Você gostaria de atualizar a versão atual?",
   footer = tagList(
    modalButton("Não"),
    actionButton("ok","Sim")
   )
  )

  observeEvent(input$ok, {
   #Agora começa-se o procedimento de atualização
   #dirnow <- getwd()
   #filetemp <- tempfile()
   #download.file(url = "https://github.com/ivanalaman/EDM/archive/master.zip",destfile = filetemp)
   #unzip(filetemp,exdir=tempdir())
   #unlink(paste0(tempdir(),"/EDM-master/inst/questionbank"),recursive=TRUE)

   pathEDM <- find.package("EDM")#encontrando o diretório do EDM
   pathqbank <- paste0(pathEDM,"/questionbank")#fazendo o caminho do banco de questões
   copysecure <- file.copy(from=pathqbank,to=tempdir(),recursive=TRUE)#copiando o banco de questões do usuário para um local seguro

   remove.packages("EDM") #removendo o pacote EDM desatualizado!
   devtools::install_github("ivanalaman/EDM") #instalando nova versão!
   file.copy(from=paste0(tempdir(),"/questionbank"),to=pathqbank,recursive=TRUE)#copiando o banco de questões do usuário de volta para o pacote

  })
 }
})
