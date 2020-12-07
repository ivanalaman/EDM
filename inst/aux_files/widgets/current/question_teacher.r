#++++++++++++++++++++++++++++++++++++++++++++++++        Achim Zeileis        ++++++++++++++++++++++++++++++++++++++++
dad_acz <- reactive({

 aa <- list.files('../../questionbank/austria/ACZ',
  pattern='*.Rnw',
  recursive=T,
  full.names=T)
 aux_1 <- list.files('../../questionbank/austria/ACZ',
  pattern='*.Rnw',
  recursive=T)
 b <- strsplit(aux_1,
  '\\/')
 dados <- do.call('rbind',
  b)

 aux_path <- getwd()
 path <- gsub('shiny/app','questionbank/austria/ACZ/',aux_path)
 
 shinyInput <- function(FUN, len, id, ...) {
  inputs <- character(len)
  for (i in seq_len(len)) {
   inputs[i] <- as.character(FUN(paste0(id, i), ...))
  }
  inputs
 }
 #  
 #  dad <- data.frame(paste('<a href="file:///',path,aux_1,'">',dados[,5],"</a>",sep=''),
 #                    dados[,1:4],
 #                    aa)
 
 dad <- data.frame(dados[,5],
  dados[,1:4],
  aa,
  Visualizar = shinyInput(actionButton,
   nrow(dados), 
   'button_', 
   icon=icon('glasses'),
   label = "", 
   onclick = 'Shiny.onInputChange(\"select_button\",  this.id)' ))
  
 names(dad) <- c(tr("narqui"),tr("disci"),tr("assun"),tr("ntipo"),tr("nnivel"),'',tr("visu"))
 dad

})

#action_acz <- DT::dataTableAjax(session, dad_acz(), rownames = TRUE)

output$questions_acz <- DT::renderDataTable({
 DT::datatable(
  dad_acz()[,-6],
  rownames = TRUE,
  escape = FALSE
  #   options = list(
  #    ajax = list(url = action_acz)
  #    )
 )
},server=FALSE)
