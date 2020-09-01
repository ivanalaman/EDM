shinyServer(function(input,output,session){           

 #+++++++++++++          File to translate words of app         +++++++++++++++#
 
 source("server_words.r",local = TRUE)$value

 #+++++++++++++            File to create the question          +++++++++++++++#
 
 source("server_create_question.r",local = TRUE)$value 

 #+++++++++++++      File to create the interactive question    +++++++++++++++#

 source("server_prog_quizz.r",local=TRUE)$value

 observe({

  shinyjs::toggleState("gerarb", input$yourname!="Achim Zeileis" && input$text!="ACZ" && nchar(input$text)==3)

 })

 #+++++++++++++            Updating the question bank           +++++++++++++++#

 source("server_update_bd.r",local = TRUE)$value

 #+++++++++++++             Create the question bank            +++++++++++++++#

 source("server_create_bd.r",local = TRUE)$value

 #+++++++++++++           Generating the course/matter          +++++++++++++++#

 source("server_create_course_matter.r",local = TRUE)$value

 #+++++++++++++            Removing the question bank           +++++++++++++++# 
 
 source("server_remove_bd.r",local = TRUE)$value
 
 #+++++++++++++               Preparing the header              +++++++++++++++#            

 source("server_head_question.r",local = TRUE)$value

 #+++++++++++++              Load the question bank             +++++++++++++++#

 isolate({

  source('../../aux_files/widgets/current/question_teacher.r',local=T)

 })

 #+++++++++++++   Creating the final vector with the questions  +++++++++++++++#
 
 source("server_final_questions.r",local = TRUE)$value

 #+++++++++++++              Gerando os arquivos                +++++++++++++++#

 source("server_generating_files.r",local = TRUE)$value 
 
 #+++++++++++++                    Update App                  +++++++++++++++#

 source("server_update_app.r",local=TRUE)$value

 #+++++++++++++             Translate update question bank file!              +++++++++++++++#

 output$up_file <- renderUI({
  file <- switch(input$language,
   br = "../../aux_files/other/update_br.md",
   en = "../../aux_files/other/update_en.md"
  )
  html <- markdown::markdownToHTML(file,fragment.only=TRUE)
  Encoding(html) <- 'UTF-8'
  return(HTML(html)) 
 })

 #+++++++++++++             Translate update app file!              +++++++++++++++#

 output$up_appfile <- renderUI({
  file <- switch(input$language,
   br = "../../aux_files/other/update_app_br.md",
   en = "../../aux_files/other/update_app_en.md"
  )
  html <- markdown::markdownToHTML(file,fragment.only=TRUE)
  Encoding(html) <- 'UTF-8'
  return(HTML(html)) 
 })

 #+++++++++++++             Translate update guide!             +++++++++++++++#

 output$up_guide <- renderUI({
  file <- switch(input$language,
   br = "../../aux_files/other/tutorial_br.md",
   en = "../../aux_files/other/tutorial_en.md"
  )
  html <- markdown::markdownToHTML(file,fragment.only=TRUE)
  Encoding(html) <- 'UTF-8'
  return(HTML(html))
 })

 session$onSessionEnded(function() {
  stopApp()
 })

 ## Debugin app!!
 #output$teste <- renderText({ str(tr("bsim")) })#é um character!!
 #output$coco <- renderText({subsubdirs()})  
})
