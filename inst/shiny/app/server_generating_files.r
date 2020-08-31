getid <- reactive({

  function(i) paste('Av', 
   gsub(' ','0',
    format(i, width=2)),sep='')
 })

 res <- reactive({ 
  exams2pdf(questions(),
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
   encoding = "UTF-8")
 })

 output$downloadPDF <- downloadHandler(filename = function(){
  paste('av','1.pdf',sep='')
 },
 content = function(arq){

  res()
  file.copy('av1.pdf',
   arq)	
 },
 contentType = 'application/pdf'

 )

 output$downloadXML <- downloadHandler(filename = function(){
  paste('moodlequiz','.xml',sep='')
 },
 content = function(file){

  exams2moodle(questions(),
   n = input$numquestion,
   dir = paste(Sys.getenv('HOME'),'/EDM',sep=''), 
   encoding = "UTF-8")

  file.copy('moodlequiz.xml',
   file)

 },
 contentType = 'application/xml'

 ) 

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
