,
#++++++++++++++++++++++++++++++++++++++++++++++++        joão         ++++++++++++++++++++++++++++++++++++++++
checkboxInput('checkquestionjja', 
              label='joão',
              value = FALSE),
conditionalPanel(
                 condition = 'input.checkquestionjja',
                 DT::dataTableOutput('questions_jja')
                 )
