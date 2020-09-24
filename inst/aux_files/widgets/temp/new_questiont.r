#++++++++++++++++++++++++++++++++++++++++++++++++        joão         ++++++++++++++++++++++++++++++++++++++++
dad_jja <- reactive({

 aa <- list.files('../../questionbank/afghanistan/JJA',
                  pattern='*.Rnw',
                  recursive=T,
                  full.names=T)
 aux_1 <- list.files('../../questionbank/afghanistan/JJA',
                     pattern='*.Rnw',
                     recursive=T)
 b <- strsplit(aux_1,
               '\\/')
 dados <- do.call('rbind',
                  b)

 aux_path <- getwd()
 path <- gsub('shiny/app','questionbank/afghanistan/JJA/',aux_path)

 dad <- data.frame(paste('<a href="file:///',path,aux_1,'">',dados[,5],"</a>",sep=''),
                   dados[,1:4],
                   aa)

 names(dad) <- c(tr("narqui"),tr("disci"),tr("assun"),tr("ntipo"),tr("nnivel"),'')
 dad

})

action_jja <- DT::dataTableAjax(session, dad_jja(), rownames = TRUE)

output$questions_jja <- DT::renderDataTable({
 DT::datatable(
           dad_jja()[,-6],
           rownames = TRUE,
           escape = FALSE,
           options = list(
                          ajax = list(url = action_jja)
                          ))
},server=FALSE)
