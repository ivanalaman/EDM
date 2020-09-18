tabPanel(uiOutput("ini"),
  h1(uiOutput("sigla"), 
  span(uiOutput("titulo"), 
   style = "font-weight: 300"), 
  style = "font-family: 'Source Sans Pro';
  color: #fff; text-align: center;
  background-image: url('backg.jpg');
  padding: 20px"),
  br(),
  span(uiOutput("saudacao"),
   style="font-size: 100px; text-align: center; color:blue; font-family: SunSans-Regular, Helvetica, Geneva"),
  withTags({
   div(id="language", class="form-group shiny-input-radiogroup shiny-input-container shiny-input-container-inline",
    style="text-align: center;",
    div(class="shiny-options-group",
     div(class="radio-inline",
      input(type="radio", name="language", value="br"),
      img(src="brazil.png", height = 100, width = 100)),
     div(class="radio-inline",
      input(type="radio", name="language", value="en", checked="checked"),
      img(src="eua.png", height = 100, width = 100))
     ))
  })
 )
