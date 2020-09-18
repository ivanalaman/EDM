#++++++++++++++++++++++++++++++++++++++++++++++++        Manuela         ++++++++++++++++++++++++++++++++++++++++
dad_mne <- reactive({

 aa <- list.files('../../questionbank/afghanistan/MNE',
                  pattern='*.Rnw',
                  recursive=T,
                  full.names=T)
 aux_1 <- list.files('../../questionbank/afghanistan/MNE',
                     pattern='*.Rnw',
                     recursive=T)
 b <- strsplit(aux_1,
               '\\/')
 dados <- do.call('rbind',
                  b)

 aux_path <- getwd()
 path <- gsub('shiny/app','questionbank/afghanistan/MNE/',aux_path)

 dad <- data.frame(paste('<a href="file:///',path,aux_1,'">',dados[,5],"</a>",sep=''),
                   dados[,1:4],
                   aa)

 names(dad) <- c(tr("narqui"),tr("disci"),tr("assun"),tr("ntipo"),tr("nnivel"),'')
 dad

})

action_mne <- DT::dataTableAjax(session, dad_mne(), rownames = TRUE)

output$questions_mne <- DT::renderDataTable({
 DT::datatable(
           dad_mne()[,-6],
           rownames = TRUE,
           escape = FALSE,
           options = list(
                          ajax = list(url = action_mne)
                          ))
},server=FALSE)
