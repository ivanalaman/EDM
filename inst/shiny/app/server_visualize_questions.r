selectedRow <- reactive({
 as.numeric(strsplit(input$select_button, "_")[[1]][2])
})

see_questions <- reactive({

 aux_que  <- list.dirss(path='../../questionbank',
  full.names = TRUE)
 siglas   <- tolower(list.dirss(aux_que))
 aux_siglas <- paste('input$checkquestion',siglas,sep='')
 aux_siglas1 <- sapply(aux_siglas, function(x) eval(parse(text=x)))
 #aux_siglas2 <- paste('input$questions_',siglas,'_rows_selected',sep='')
 #aux_siglas22 <- sapply(aux_siglas2, function(x) eval(parse(text=x)),simplify=FALSE)

 aux_que3 <- paste('dad_',siglas,'()[',selectedRow(),',6]', sep='')  
 aux_que4 <- aux_que3[aux_siglas1]
 que <- unlist(sapply(aux_que4, function(x) eval(parse(text=x))))

 enc <- sapply(que,
  function(x) readr::guess_encoding(x,n_max=1000)$encoding[1])

 conv <- mapply(function(x,y) {
  aux1 <- iconv(readLines(x),
   from=y,
   to="UTF-8")
  aux2 <- file(x, 
   encoding="UTF-8")
  writeLines(aux1,
   aux2)
  close(aux2)
  },
  que,
  enc)													
 as.vector(que)
})
