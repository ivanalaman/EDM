# Gerenciador de banco de questões EDM

## Introdução
O pacote EDM (Exams Database Manager) foi elaborado utilizando o pacote [shiny](https://cran.r-project.org/web/packages/shiny/index.html) do software [R](https://www.r-project.org/). Para conhecer melhor o pacoge [shiny](https://cran.r-project.org/web/packages/shiny/index.html) visite a página oficial [https://shiny.rstudio.com/](https://shiny.rstudio.com/). 

O objetivo é fornecer uma interface gráfica em html para gerar provas em PDF e em XML (formato do MOODLE) por meio de um banco de questões gerenciável. Ainda, é possível programar questões dos mais variados tipos como: dissertativa texto, dissertativa numérica, única escolha, múltipla escolha, associação e mista (combinando algumas das opções anteriores). 

Outro aspecto interessante do pacote é a possibilidade de gerar provas utilizando o banco de questões de outros professores, aumentado de forma significativa as opções de um professor elaborar uma prova. Imagine que o pacote EDM contenha 5 banco de questões da sua área de atuação, incluindo a sua. Imagine que em cada banco de questões tenha 10 questões. Então, ao elaborar uma prova você contará com um total de 50 questões. Por isso é tão importante que você compartilhe seu banco de questões. Mais abaixo terá instruções de como fazer isso.

## Pré-requisitos para instalação do pacote EDM
Você deve primeiramente instalar o software [R](https://www.r-project.org/). Existem vários vídeos no [youtube](https://www.youtube.com/) ensinando como fazer isso. Uma sugestão de vídeo é [https://www.youtube.com/watch?v=HNJpWe_kh8Y](https://www.youtube.com/watch?v=HNJpWe_kh8Y). 

Instale também o pacote [devtools](https://cran.r-project.org/web/packages/devtools/index.html), pois precisaremos de sua função `install_github` para instalar o pacote EDM. Caso não saiba como fazer isto, abra o programa [R](https://www.r-project.org/) e digite no console:

```{r}
install.packages('devtools')
```

Ou assista o vídeo a seguir: [https://www.youtube.com/watch?v=P2bE-HIng08](https://www.youtube.com/watch?v=P2bE-HIng08). 

## Pré-requisitos de instalação para gerar as provas em PDF
Os arquivos PDF gerados pelo pacote EDM utilizam o programa [LaTeX](https://www.latex-project.org/), que é um sistema de altíssimo nível utilizado para preparação de documentos. 

Logo, se você não tem este programa instalado em sua máquina, instale o pacote [tinytex](https://cran.r-project.org/web/packages/tinytex/index.html) do software R e execute os seguintes comandos:

```{r}
library(tinytex)
install_tinytex()
```

A depender da velocidade de sua internet, o procedimento citado irá demandar um pouco de tempo. Logo, espere até a finalização da instalação.

## Pré-requisitos de instalação para gerar as provas em XML
Para gerar as provas em XML é necessário antes ter instalado o programa [pandoc](https://pandoc.org/installing.html). Caso o programa R esteja aberto após a finalização da instalação, feche-o e, reinicie para o reconhecimento do [pandoc](https://pandoc.org/installing.html).

## Instalação do pacote EDM
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

<!--![homeedm](https://github.com/ivanalaman/EDM/blob/master/inst/images/homeedm.png)-->
<img src="http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/homeedm.png" width="650" height="450" />

Explore o aplicativo navegando nos diferentes __menus__. Gere uma prova no formato PDF para testar se os pré-requisitos foram bem instalados. Veja a figura a seguir:

<img src="http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/gerarpdf.png" width="650" height="450" />

Se tudo ocorreu certo, deverá abrir um popup informando onde os arquivos foram salvos. 

<img src="http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/messagesavepdf.png" width="650" height="450" />

São criados dois arquivos. Um é referente ao gabarito e outro referente a prova. Por padrão, o arquivo é salvo dentro da pasta **EDM** criada no seu diretório de trabalho. No windows por exemplo, você encontrará a pasta no seguinte caminho: **C:\Usuários\Seunome\Documentos\EDM**. No linux o caminho seria: **/home/usuário/EDM**. 

<img src="http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/edmfolder.png" width="650" height="450" />

Se não consta na pasta nenhum arquivo, provavelmente ocorreu algum erro devido alguma instalação anterior.

Se você for usuário LaTeX e já tem instalado o TeXLive ou o MiKTeX e mesmo assim houve erro ao gerar o PDF, execute os passos da seção **Pré-requisitos de instalação para gerar as provas em PDF**. 

Se ainda sim o problema persistir, não hesite em enviar um email para iballaman@uesc.br para obter ajuda.

## Criando um banco de questões
Depois de ter explorado o aplicativo, chegou o momento de você criar o seu próprio banco de questões para utilizá-lo na elaboração de suas provas. A figura abaixo mostra o procedimento.

<img src="http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/criarbq.png" width="650" height="450" />

<!--Caso prefira ver um vídeo, segue o link: https://em construção.-->

Após criar o banco de questões, siga as instruções que constam no repositório [questionbankEDM](https://github.com/ivanalaman/questionbankEDM/tree/master/inst/lang/portuguese_br#Formando-o-banco-de-quest%C3%B5es) do github.

## Programando questões
O pacote EDM possui um menu específico para elaboração de questões, tanto interativo quanto não interativo. Para aqueles que não tem nenhuma familiaridade com códigos [LaTeX](https://www.latex-project.org/), poderá utilizar a interface interativa. Já aqueles que tem familiaridade com o [LaTeX](https://www.latex-project.org/), poderá utilizar o menu não interativo.

<img src="http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/pquestao.png" width="650" height="200" />

### Questão dissertativa do tipo texto
Este tipo de questão tem apenas uma resposta que no caso é um texto. Recomenda-se que a resposta seja a mais objetiva possível. Vejamos um exemplo:

<ol>
 <li><b> Defina probabilidade!</b></li>
 <p><i>Resposta: Probabilidade é um número que expressa a chance de um determinado evento acontecer..</i></p>
</ol>

A elaboração do exemplo acima utilizando o aplicativo pode ser visualizados na figura a seguir:

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qtexto.png)

### Questão dissertativa do tipo numérica
A ideia é a mesma da questão dissertativa do tipo texto, porém, a resposta é do tipo numérica. Exemplo:

<ol>
 <li><b> Qual é a média de uma amostra composta pelos seguintes valores: 1,2,3,4,5?</b></li>
 <p><i>Resposta: 3</i></p>
</ol>

Perceba que o valor é único, sem texto algum. Caso seja um número decimal,então use ponto como unidade separadora da parte inteira da parte fracionária (2.25 por exemplo).

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qnum.png)

### Questão do tipo única escolha
É conhecida também como questão **objetiva**, pois só há uma questão correta.
Exemplo:

<ol>
 <li><b> Qual medida estatística é influenciada por valores extremos?</b></li>
 <ol type='a'>
  <li>Média</li>
  <li>Mediana</li>
  <li>Moda</li>
  <li>Amplitude</li>
  <li>Nenhuma alternativa está correta</li>
 </ol>
  <p><i>Resposta: Alternativa a</i></p>
</ol>

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/quesco.png)

### Questão do tipo múltipla escolha
Neste tipo de questão podemos ter mais de uma questão correta, todas corretas ou todas falsas. Conhecida também como questão do tipo **verdadeiro** ou **falso**.
Exemplo:

<ol>
 <li><b> Assinale a(s) alternativa(s) verdadeira(s) quanto ao assunto probabilidade.</b></li>
 <ol type='a'>
  <li>É um número que expressa a chance de um determinado evento ocorrer.</li>
  <i>Resposta: Verdadeiro</i> 
 <li>Seja A um evento definido em um espaço amostral $\omega$ e $\bar{A}$ o evento complementar, então P(A)=P($\omega$) - 1.</li>
  <i>Resposta: Falso</i>
  <li>Sejam A e B dois eventos mutuamente exclusivos,então P(A$\cup$B) = P(A) + P(B).</li>
  <i>Resposta: Verdadeiro</i>
  <li>Sejam A e B dois eventos independentes, então P(A$\cap$B) = P(A) $\cdot$ P(B).</li>
   <i>Resposta: Verdadeiro</i>
<li>Sejam A e B dois eventos quaisquer, então P(A/B) = P(A$\cup$B)/P(A).</li>
   <i>Resposta: Falso</i>
  <li>João disse ao Raimundo que a chance dele ganhar na mega-sena é de -35%, pois é um cara muito azarado.</li>
   <i>Resposta: Falso</i>
<li>Manoel mora em Manaus e disse que sempre leva guarda-chuva ao sair para o serviço, pois a chance de chover é de 100%.</li>
   <i>Resposta: Falso</i>
 </ol>
</ol>

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qmesco.png)

### Questão do tipo associativa
O objetivo nesta questão é estabelecer uma relação entre duas listas.
Exemplo:

<ol>
 <li><b>Classifique as variáveis abaixo em discreta ou contínuas.</b></li>
<ol type='1'>
<li>Discreta</li>
<li>Contínua</li>
</ol>
</ol>
</br>

<ol type='a'>
<li>Número de filhos</li>
<i>Resposta: 1</i>
<li>Número de empregados (un.)</li>
<i>Resposta: 1</i>
<li>Peso (kg)</li>
<i>Resposta: 2</i>
<li>Altura (m)</li>
<i>Resposta: 2</i>
<li>Preço de um produto (R$)</li>
<i>Resposta: 2</i>
<li>Demanda bioquímica de oxigênio (mg/L)</li>
<i>Resposta: 2</i>
<li>pH</li>
<i>Resposta: 2</i>
</ol>

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qasso.png)

### Questão do tipo mista
Neste tipo de questão é possível misturar entre os tipos de questão já abordados anteriormente. No exemplo abaixo, temos duas alternativas, sendo uma do tipo **texto** e outra do tipo **numérica**.
Exemplo:

<ol>
<li><b>Considere os seguintes dados: 1,2,3,4,4,5,5,5,6,6,6,6.</b></li>
<ol type='a'>
<li>Qual medida de tendência central tem o maior valor?</li>
<i>Resposta: Moda</i>
<li>Qual é o valor da média?</li>
<i>Resposta: 4,42</i>
</ol>
</ol>

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qmista.png)

### Questão com figura
Caso a questão tenha figura, é possível adicionar colocando o endereço completo de onde está a figura. Caso não saiba como copiar o endereço completo do arquivo, veja a figura abaixo.

<img src="http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qfig0.png" width="700" height="200" />

No caso do windows, você deve trocar o "&#92;" por "/" no endereço copiado da imagem anterior.

Sugiro que crie uma pasta chamada "figuras" no mesmo diretório onde está o arquivo da questão. Veja a figura abaixo.

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qfig1.png)

A figura a seguir mostra a elaboração de uma questão do tipo texto com figura.

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qfig2.png)


## Salvando as questões no diretório correto

Após elaborar uma questão, o arquivo deve ser salvo no diretório correto para que o aplicativo possa encontrar tais arquivos. Vamos partir do princípio que você criou o seu banco de questões (IBA por exemplo), sua disciplina (estatistica_basica) e um assunto (introducao). Supondo que a questão é do tipo objetiva e de nível fácil, então o arquivo "minhaquestao.Rnw" deve ser salva no diretório:

* No caso do Windows
    * C:\\usuários\\ivan\\Documentos\\R\\win-library\\4.0\\EDM\\questionbank\\brazil\\IBA\\estatistica_basica\\introducao\\objetiva\\facil\\minhaquestao.Rnw
* No caso do Linux
    * /home/ivan/R/x86_64-pc-linux-gnu-library/4.0/EDM/questionbank/brazil/IBA/estatistica_basica/introducao/objetiva/facil/minhaquestao.Rnw

Não se esqueça de nomear adequadamente os arquivos. Veja o tópico [Padronizando o nome dos arquivos](https://github.com/ivanalaman/questionbankEDM/tree/master/inst/lang/portuguese_br#Padronizando-o-nome-dos-arquivos).



 

