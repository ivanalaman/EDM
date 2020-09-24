# Gerenciador de banco de questões EDM

## Introdução
O pacote EDM (Exams Database Manager) foi elaborado utilizando o pacote [shiny](https://cran.r-project.org/web/packages/shiny/index.html) do software [R](https://www.r-project.org/). Para conhecer melhor o pacoge [shiny](https://cran.r-project.org/web/packages/shiny/index.html) visite a página oficial https://shiny.rstudio.com/. 

O objetivo é fornecer uma interface gráfica em html para gerar provas em PDF e em XML (formato do MOODLE) por meio de um banco de questões gerenciável. Ainda, é possível programar questões dos mais variados tipos como: dissertativa texto, dissertativa numérica, única escolha, múltipla escolha, associação e mista (combinando algumas das opções anteriores). 

Outro aspecto interessante do pacote é a possibilidade de gerar provas utilizando o banco de questões de outros professores, aumentado de forma significativa as opções de um professor elaborar uma prova. Imagine que o pacote EDM contenha 5 banco de questões da sua área de atuação, incluindo a sua. Imagine que em cada banco de questões tenha 10 questões. Então, ao elaborar uma prova você contará com um total de 50 questões. Por isso é tão importante que você compartilhe seu banco de questões. Mais abaixo terá instruções de como fazer isso.

## Pré-requisitos para instalação
Você deve primeiramente instalar o software [R](https://www.r-project.org/). Existem vários vídeos no [youtube](https://www.youtube.com/) ensinando como fazer isso. Uma sugestão de vídeo é https://www.youtube.com/watch?v=HNJpWe_kh8Y. Se o intuito for gerar provas em PDF, então você deve ter instalado também o programa [MikTeX](https://miktex.org/). 

Como o pacote EDM não está disponível oficialmente no [CRAN](https://cran.r-project.org/), sugiro fortemente a instalação do programa [Rtools](https://cran.r-project.org/bin/windows/Rtools/), para evitar aborrecimentos na hora de instalar o pacote EDM.

Instale também os pacotes [devtools](https://cran.r-project.org/web/packages/devtools/index.html) e [tinytex](https://cran.r-project.org/web/packages/tinytex/index.html). Caso não saiba como fazer isto, abra o programa [R](https://www.r-project.org/) e digite no console:

```{r}
install.packages('devtools')
```

Ou assista o vídeo a seguir: https://www.youtube.com/watch?v=P2bE-HIng08. Proceda da mesma forma com o pacote [tinytex](https://cran.r-project.org/web/packages/tinytex/index.html).

## Instalação
Abra o programa [R](https://www.r-project.org/) e digite no console os seguintes comandos:

```{r}
library(devtools)
install_github('ivanalaman/EDM',upgrade="never",force=TRUE)
```

Caso queira criar um clone deste repositório e instalar o pacote EDM a partir deste clone, então em um emulador de terminal faça: 

> git clone  git://github.com/ivanalaman/EDM.git

or

> git clone https://ivanalaman@github.com/EDM.git

Em seguida, execute os seguintes comandos:

> R CMD check EDM

> R CMD build EDM

> R CMD INSTALL EDM_X.X-X.tar.gz

## Utilizando o pacote EDM
Abra o programa [R](https://www.r-project.org/) e digite no console os seguintes comandos:

```{r}
library(EDM)
startEDM()
```
Deverás abrir uma página em html no seu navegador padrão como sugere a figura a seguir:

![homeedm](https://github.com/ivanalaman/EDM/blob/master/inst/images/homeedm_br.jpg)

Explore o aplicativo navegando nos diferentes __menus__. Gere uma prova no formato PDF para ver como funciona. Veja a figura a seguir:

![gerarpdf](https://github.com/ivanalaman/EDM/blob/master/inst/images/gerarpdf_br.gif)

Se tudo ocorreu certo, o arquivo foi salvo dentro da pasta **EDM** criada na seu diretório de trabalho. No windows por exemplo, você encontrará a pasta no seguinte caminho: **C:\Usuários\Seunome\Documentos\EDM**. No linux o caminho seria: **/home/usuário/EDM**. Se não consta na pasta nenhum arquivo, provavelmente ocorreu algum erro devido alguma instalação anterior. Neste caso, envie um email para iballaman@uesc.br para que eu posso te ajudar.

## Criando um banco de questões
Depois de ter explorado o aplicativo, chegou o momento de você criar o seu próprio banco de questões para utilizá-lo na elaboração de suas provas. A figura abaixo mostra o procedimento.

![criarbq](https://github.com/ivanalaman/EDM/blob/master/inst/images/criarbq_br.gif)

<!--Caso prefira ver um vídeo, segue o link: https://em construção.-->

Após criar o banco de questões, siga as instruções que constam no seguinte link: https://github.com/ivanalaman/questionbankEDM/tree/master/lang/portuguese_br#Formando-o-banco-de-quest%C3%B5es.

## Programando questões
O pacote EDM possui um menu específico para elaboração de questões, tanto interativo quanto não interativo. Para aqueles que não tem nenhuma familiaridade com códigos [LaTeX](https://www.latex-project.org/), poderá utilizar a interface interativa. Já aqueles que tem familiaridade com o [LaTeX](https://www.latex-project.org/), poderá utilizar o menu não interativo.

### Questão dissertativa do tipo texto
Este tipo de questão tem apenas uma resposta que no caso é um texto. Recomenda-se que a resposta seja a mais objetiva possível. Vejamos um exemplo:

<ol>
 <li><b> Defina população!</b></li>
 <p>População é o conjunto de todos os indivíduos que possui pela menos uma característica comum e observável.</p>
</ol>

A elaboração do exemplo acima utilizando o aplicativo e o local onde o arquivo deve ser salvo podem ser visualizados na figura a seguir:

![questext](https://github.com/ivanalaman/EDM/blob/master/inst/images/qtexto_br.gif)

### Questão dissertativa do tipo numérica
A ideia é a mesma da questão dissertativa do tipo texto, porém, a resposta é do tipo numérica. Exemplo:

<ol>
 <li><b> Qual é a média de uma amostra composta pelos seguintes valores: 1,2,3,4,5?</b></li>
 <p>3</p>
</ol>

Perceba que o valor é único, sem texto algum. Caso seja um número decimal,então use ponto como unidade separadora da parte inteira da parte fracionária (2.25 por exemplo).

A figura a seguir resume o procedimento desta seção.

![quesnum](https://github.com/ivanalaman/EDM/blob/master/inst/images/qnum_br.gif)

### Questão do tipo única escolha

<ol>
 <li><b> Qual medida estatística é influenciada por valores extremos?</b></li>
 <ol type='a'>
  <li>Média</li>
  <li>Mediana</li>
  <li>Moda</li>
  <li>Amplitude</li>
  <li>Nenhuma alternativa está correta</li>
 </ol>
</ol>

### Questão do tipo múltipla escolha

<ol>
 <li><b> Assinale a(s) alternativa(s) verdadeira(s) quanto ao assunto probabilidade.</b></li>
 <ol type='a'>
  <li>É um número que expressa a chance de um determinado evento ocorrer.</li>
  <li>Seja A um evento definido em um espaço amostral $\omega$ e $\bar{A}$ o evento complementar, então P(A)=P($\omega$) - 1.</li>
  <li>Sejam A e B dois eventos mutuamente exclusivos,então P(A$\cup$B) = P(A) + P(B).</li>
  <li>Sejam A e B dois eventos independentes, então P(A$\cap$B) = P(A) $\cdot$ P(B).</li>
  <li>Sejam A e B dois eventos quaisquer, então P(A/B) = P(A$\cup$B)/P(A).</li>
  <li>João disse ao Raimundo que a chance dele ganhar na mega-sena é de -35%, pois é um cara muito azarado.</li>
  <li>Manoel mora em Manaus e disse que sempre leva guarda-chuva ao sair para o serviço, pois a chance de chover é de 100%.</li>
 </ol>
</ol>

### Questão do tipo associativa

### Questão do tipo mista




 

