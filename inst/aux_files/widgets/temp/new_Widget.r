,
#++++++++++++++++++++++++++++++++++++++++++++++++        Manuela         ++++++++++++++++++++++++++++++++++++++++
checkboxInput('checkquestionmne', 
              label='Manuela',
              value = FALSE),
conditionalPanel(
                 condition = 'input.checkquestionmne',
                 DT::dataTableOutput('questions_mne')
                 )
