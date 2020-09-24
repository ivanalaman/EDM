 output$discip1 <- renderUI({

  radioButtons('input.dirs',
   label = h4(tr("esbanqu")),
   choices = eval(parse(text=listad())),
   selected = 'austria')

 }) 

 subdirs <- reactive({

  subdirs <- list.dirss(paste('../../questionbank/',
    input$input.dirs,
    sep=''))
  subdirs

 })

 listaa <- reactive({

  aux_lista <- paste("'",
   subdirs(),
   "'='",
   subdirs(),
   "'",
   sep='',
   collapse=',')
  lista <- paste('list(',
   aux_lista,
   ')',
   sep='')
  lista
 }) 

 output$discip2 <- renderUI({

  tagList(
   radioButtons('input.subdirs',
    label = h4(tr("esbdados")),
    choices = eval(parse(text=listaa()))),
   textInput('yourdisci', 
    label= h4(tr("condisc")),
    value = 'calculo_I')
  )
 }) 

 observeEvent(input$gerard, {

  auxdisc <- paste('../../questionbank/',
   input$input.dirs,
   '/',
   input$input.subdirs,
   '/',
   input$yourdisci,
   sep='') 

  dir.create(auxdisc, recursive=T) 

  showModal(modalDialog(
    title = uiOutput("tirefreshapp"),
    uiOutput("merefreshapp"),
    footer = tagList(
     actionButton('closecreatecc',"Ok!")
     ),
    size='m'
    )) 

  observeEvent(input$closecreatecc,{
   stopApp()
   })
 
 })

 subsubdirs <- reactive({

  subsubdirs <- list.dirss(paste('../../questionbank/',
    input$input.dirs, # country
    '/',
    input$input.subdirs,# peaple
    sep=''))
  req(subsubdirs) #protecao quando o objeto for NULL ou algo parecido
 })

 listaaa <- reactive({

  aux_lista <- paste("'",
   subsubdirs(),
   "'='",
   subsubdirs(),
   "'",
   sep='',
   collapse=',')
  lista <- paste('list(',
   aux_lista,
   ')',
   sep='')
  lista 
 }) 

 #+++++++++++++ Gerar assunto +++++++++++++++++++

 output$assunt <- renderUI({

  wellPanel(
   radioButtons('input.subsubdirs',
    label = h4(tr("esdisc")),
    choices = eval(parse(text=listaaa()))),
   textInput('yourass', 
    label= h4(tr("conass")),
    value = 'probability') 
  )
 })

 ####################################################

 observeEvent(input$gerara, {

  output$alert_as <- renderUI({ sidebarPanel(print("OK!"))})   
  auxass <- paste('../../questionbank/',
   input$input.dirs,
   '/',
   input$input.subdirs,
   '/',
   input$input.subsubdirs,
   '/',
   input$yourass,
   sep='') 

  subsub <- c(tr("pdisc"),tr("pobj"))
  subsubsub <- c(tr("pnifa"),tr("pnme"),tr("pndif"))

  aux1 <- paste(auxass,
   '/',
   subsub,
   sep='')

  aux2 <- sapply(aux1,
   function(x)paste(x,
    subsubsub,
    sep='/'))

  lapply(aux2,function(x)sapply(x,function(y)dir.create(y,recursive=T)))

  showModal(modalDialog(
    title = uiOutput("tirefreshapp"),
    uiOutput("merefreshapp"),
    footer = tagList(
     actionButton('closecreatecm',"Ok!")
     ),
    size='m'
    )) 

  observeEvent(input$closecreatecm,{
   stopApp()
   })

 })
