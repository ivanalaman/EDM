output$headexamsUI <- renderUI({
 tagList( 
  textInput('textaval',h5(uiOutput("templ2")),value=tr("headaval")),
  textInput('textunid',h5(uiOutput("templ3")),value=tr("headunid")),
  textInput('textdisc',h5(uiOutput("templ4")),value=tr("headdisc")),
  textInput('textcarg',h5(uiOutput("templ5")),value=tr("headchor"))
 )
}) 

observe({

 # + Nome da avaliação
 textaval <- file('../../sup/aval.tex',
  encoding='UTF-8')
 cat(input$textaval,
  file=textaval)
 close(textaval)

 # + Nome da unidade
 textunid <- file('../../sup/unid.tex',
  encoding='UTF-8')
 cat(input$textunid,
  file=textunid)
 close(textunid)

 # + Nome da disciplina
 textdisc <- file('../../sup/disc.tex',
  encoding='UTF-8')
 cat(input$textdisc,
  file=textdisc)
 close(textdisc)

 # + Carga horária
 textcarg <- file('../../sup/carg.tex',
  encoding='UTF-8')
 cat(input$textcarg,
  file=textcarg)
 close(textcarg)

 # + Período letivo
 textano <- file('../../sup/anol.tex',
  encoding='UTF-8')
 cat(input$textanol,
  file=textano)
 close(textano)

 # + Nome
 textname <- file('../../sup/nome.tex',
  encoding='UTF-8')
 cat(input$textname,
  file=textname)
 close(textname)

})            
