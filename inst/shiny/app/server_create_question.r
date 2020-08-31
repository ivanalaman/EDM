output$exeabertat <- renderUI({

  source("../../aux_files/other/aberta.R",local=TRUE)$value

 })	

 output$exeabertan <- renderUI({

  source("../../aux_files/other/numerica.R",local=TRUE)$value

 })

 output$exemultiplaes <- renderUI({

  source("../../aux_files/other/multiplaes.R",local=TRUE)$value

 })

 output$exeunicaes <- renderUI({

  source("../../aux_files/other/unicaes.R",local=TRUE)$value

 })

 output$exeassociacao <- renderUI({

  source("../../aux_files/other/associacao.R",local=TRUE)$value

 })

 output$exemista <- renderUI({

  source("../../aux_files/other/mista.R",local=TRUE)$value

 })

