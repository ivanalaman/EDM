HTML(paste0('<textarea id="inputTextToSave2" style="width: 700px; height: 250px;" rows="3" cols="40"><<echo=FALSE,results=hide>>= &#13;&#10;@ &#13;&#10; &#13;&#10;\\begin{question} &#13;&#10;',
 tr("quesnum"),
  '&#13;&#10;\\end{question}  &#13;&#10; &#13;&#10;\\begin{solution} &#13;&#10;',
  tr("resolnum"),
  '&#13;&#10;\\end{solution} &#13;&#10; &#13;&#10;%% META-INFORMATION &#13;&#10;%% \\extype{num} &#13;&#10;%% \\exsolution{3}  </textarea>'
))
