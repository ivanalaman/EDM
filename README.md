# Exams Database Manager EDM

<p align="center">
  <span>English</span> |
  <a href="https://github.com/ivanalaman/EDM/tree/master/inst/lang/portuguese_br">Portuguese-Brazil</a>
</p>

- [Introduction](https://github.com/ivanalaman/EDM#Introduction)
- [Prerequisites for installing the EDM package](https://github.com/ivanalaman/EDM#Prerequisites-for-installing-the-EDM-package)
- [Installation prerequisites to generate PDF proofs](https://github.com/ivanalaman/EDM#Installation-prerequisites-to-generate-PDF-proofs)
- [Installation prerequisites for generating XML proofs](https://github.com/ivanalaman/EDM#Installation-prerequisites-for-generating-XML-proofs)
- [Installation of the EDM package](https://github.com/ivanalaman/EDM#Installation-of-the-EDM-package)
- [Using the EDM package](https://github.com/ivanalaman/EDM#Using-the-EDM-package)
- [Creating a question bank](https://github.com/ivanalaman/EDM#Creating-a-question-bank)
- [Programming question](https://github.com/ivanalaman/EDM#Programming-question)
  - [Text type essay question](https://github.com/ivanalaman/EDM#Text-type-essay-question)
  - [Numerical type essay question](https://github.com/ivanalaman/EDM#Numerical-type-essay-question)
  - [Single choice question](https://github.com/ivanalaman/EDM#Single-choice-question)
  - [Multiple choice question](https://github.com/ivanalaman/EDM#Multiple-choice-question)
  - [Associative question](https://github.com/ivanalaman/EDM#Associative-question)
  - [Mixed type question](https://github.com/ivanalaman/EDM#Mixed type question)
- [Question with figure](https://github.com/ivanalaman/EDM#Question-with-figure)
- [Saving the questions in the correct directory](https://github.com/ivanalaman/EDM#Saving-the-questions-in-the-correct-directory)

## Introduction
The EDM (Exams Database Manager) package was developed using the [shiny](https://CRAN.R-project.org/package=shiny) package  of the software [R](https://www.r-project.org/). To learn more about package [shiny](https://CRAN.R-project.org/package=shiny) visit the official page [https://shiny.rstudio.com/](https://shiny.rstudio.com/).

The goal is to provide a graphical interface in html to generate proofs in PDF and XML (MOODLE format) through a manageable question bank. Still, it is possible to program questions of the most varied types as: text essay, numerical essay, single choice, multiple choice, association and mixed (combining some of the previous options).

Another interesting aspect of the package is the possibility of generating tests using the question bank of other teachers, significantly increasing the options for a teacher to prepare a test. Imagine that the EDM package contains 5 question banks in your area of ​​expertise, including yours. Imagine that each question bank has 10 questions. Then, when preparing a test you will have a total of 50 questions. That's why it's so important that you share your question bank. Below you will find instructions on how to do this.

## Prerequisites for installing the EDM package
You must first install the [R](https://www.r-project.org/) software. There are several videos on [youtube](https://www.youtube.com/) teaching how to do this. A video suggestion is [https://www.youtube.com/watch?v=HNJpWe_kh8Y](https://www.youtube.com/watch?v=HNJpWe_kh8Y).

Also install the [devtools](https://CRAN.R-project.org/package=devtools) package, as we will need its `install_github` function to install the EDM package. If you do not know how to do this, open the program [R](https://www.r-project.org/) and type in the console:

```{r}
install.packages('devtools')
```

Or watch the following video: [https://www.youtube.com/watch?v=P2bE-HIng08](https://www.youtube.com/watch?v=P2bE-HIng08).

## Installation prerequisites to generate PDF proofs
The PDF files generated by the EDM package use the [LaTeX](https://www.latex-project.org/) program, which is a very high-level system used for preparing documents.

Therefore, if you do not have this program installed on your machine, install the package [tinytex](https://CRAN.R-project.org/package=tinytex) of the [R](https://www.r-project.org/) software and run the following commands :

```{r}
library(tinytex)
install_tinytex()
```

Depending on the speed of your internet, the mentioned procedure will take a little time. Then, wait until the installation is complete.

## Installation prerequisites for generating XML proofs
To generate the proofs in XML, it is necessary to have installed the program [pandoc](https://pandoc.org/installing.html). If the [R](https://www.r-project.org/) program is open after the installation is complete, close it and restart to recognize [pandoc](https://pandoc.org/installing.html).

## Installation of the EDM package
Open the [R](https://www.r-project.org/) program  and enter the following commands on the console:

```{r}
library(devtools)
install_github('ivanalaman/EDM', upgrade = "never", force = TRUE)
```

If you want to create a clone of this repository and install the EDM package from this clone, then in a terminal emulator do:

> git clone git://github.com/ivanalaman/EDM.git

or

> git clone https://ivanalaman@github.com/EDM.git

Then, run the following commands:

> R CMD check EDM

> R CMD build EDM

> R CMD INSTALL EDM_X.X-X.tar.gz

## Using the EDM package
Open the [R](https://www.r-project.org/) program and enter the following commands on the console:

```{r}
library(EDM)
startEDM()
```
You should open a page in html in your default browser as suggested in the following figure:

<img src = "http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/homeedm.png" width = "650" height = "450" />

Explore the app by browsing the different __menus__. Generate a test in PDF format to test whether the prerequisites have been successfully installed. Look the following picture:

<img src = "http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/gerarpdf.png" width = "650" height = "450" />

If everything went well, you should open a popup informing you where the files were saved.

<img src = "http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/messagesavepdf.png" width = "650" height = "450" />

Two files are created. One is for feedback and the other for proof. By default, the file is saved inside the **EDM** folder created in your working directory. In windows for example, you will find the folder in the following path: **C:\Users\Yourname\Documents\EDM**. In Linux the path would be: **/home/user/EDM**.

<img src = "http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/edmfolder.png" width = "650" height = "400" />

If there is no file in the folder, an error probably occurred due to a previous installation.

If you are a LaTeX user and have already installed TeXLive or MiKTeX and still had an error generating the PDF, perform the steps in the section **Installation prerequisites to generate the PDF proofs**.

If the problem still persists, do not hesitate to send an email to iballaman@uesc.br for help.

## Creating a question bank
After you have explored the application, the time has come for you to create your own question bank to use it in preparing your exams. The figure below shows the procedure.

<img src = "http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/criarbq.png" width = "650" height = "400" />

After creating the question bank, follow the instructions in the [questionbankEDM](https://github.com/ivanalaman/questionbankEDM#Building-the-question-bank) repository from github.

## Programming issues
The EDM package has a specific menu for elaborating questions, both interactive and non-interactive. For those who are not familiar with [LaTeX](https://www.latex-project.org/) codes, you can use the interactive interface. For those familiar with [LaTeX](https://www.latex-project.org/), you can use the non-interactive menu.

<img src = "http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/pquestao.png" width = "650" height = "200" />

### Text type essay question
This type of question has only one answer, which in this case is a text. It is recommended that the answer be as objective as possible. Let's look at an example:

<ol>
 <li><b>Define probability!</b></li>
 <i>Answer: Probability is a number that expresses the chance that a certain event will happen.</i>
</ol>

The elaboration of the example above using the application can be seen in the following figure:

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qtexto.png)

### Numerical type essay question
The idea is the same as the text-based essay question, however, the answer is a numerical one. Example:

<ol>
 <li><b> What is the average of a sample composed of the following values: 1,2,3,4,5? </b></li>
 <i> Answer: 3</i>
</ol>

Realize that the value is unique, without any text. If it is a decimal number, then use a dot as a separator unit for the entire part of the fractional part (2.25 for example).

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qnum.png)

### Single choice question
It is also known as the **objective** question, as there is only one correct question.
Example:

<ol>
 <li><b> Which statistical measure is influenced by extreme values? </b></li>
 <ol type = 'a'>
  <li> Average </li>
  <li> Median </li>
  <li> Fashion </li>
  <li> Amplitude </li>
  <li> No alternative is correct </li>
 </ol>
 <i> Answer: Alternative a</i>
</ol>

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/quesco.png)

### Multiple choice question
In this type of question we can have more than one correct question, all correct or all false. Also known as a **true** or **false** question.
Example:

<ol>
 <li><b>Tick the real alternative (s) on the subject of probability.</b></li>
 <ol type = 'a'>
  <li>It is a number that expresses the chance that a certain event will occur.</li>
  <i>Answer: True</i>
 <li>Let A be an event defined in a sample space $\omega$ and $\bar{A}$ the complementary event, so P(A) = P($\omega$) - 1.</li>
  <i>Answer: False</i>
  <li>Let A and B be two mutually exclusive events, so P (A$\cup$B) = P (A) + P (B).</li>
  <i>Answer: True</i>
  <li>Let A and B be two independent events, so P (A $\cap$B) = P(A) $\cdot$ P(B). </li>
   <i>Answer: True </i>
<li> Let A and B be any two events, then P(A/B) = P(A $\cup$ B)/P(A). </li>
   <i>Answer: False </i>
  <li>João told Raimundo that his chance of winning in the mega-sena is -35%, as he is a very unlucky guy. </li>
   <i>Answer: False </i>
<li>Manoel lives in Manaus and said he always takes an umbrella when he leaves for work, as the chance of rain is 100%. </li>
   <i>Answer: False </i>
 </ol>
</ol>

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qmesco.png)

### Associative question
The purpose of this question is to establish a relationship between two lists.
Example:

<ol>
 <li><b> Classify the variables below as discrete or continuous. </b></li>
<ol type = '1'>
<li>Discrete </li>
<li>Continuous </li>
</ol>
</ol>
</br>

<ol type = 'a'>
<li>Number of children </li>
<i>Answer: 1 </i>
<li>Number of employees (un.) </li>
<i>Answer: 1 </i>
<li>Weight (kg) </li>
<i>Answer: 2 </i>
<li>Height (m) </li>
<i>Answer: 2 </i>
<li>Price of a product (R $) </li>
<i>Answer: 2 </i>
<li>Biochemical oxygen demand (mg / L) </li>
<i>Answer: 2 </i>
<li>pH </li>
<i>Answer: 2 </i>
</ol>

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qasso.png)

## Mixed type question
This type of question involves subquestions that can be of different types. In this example, we have the combination of a text-type alternative and a numeric-type alternative.

<ol>
 <li><b> Considere os seguintes dados. </b></li>
<p>1,2,3,4,4,5,5,5,6,6,6,6</p>
<ol type = 'a'>
<li>Which measure of central tendency has the greatest value?</li>
<i>Answer: Mode</i>
<li>What is the average value?</li>
<i>Answer: 4.42</i> 
</ol>
</ol>
</br>


### Question with figure
If the question has a picture, it is possible to add it by placing the full address where the picture is. If you do not know how to copy the complete file address, see the figure below.

<img src = "http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qfig0.png" width = "700" height = "200"/>

In the case of windows, you must change the "&#92;" by "/" in the address copied from the previous image.

I suggest that you create a folder called "pictures" in the same directory where the question file is. See the figure below.

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qfig1.png)

The following figure shows the elaboration of a text-type question with a figure.

![](http://nbcgib.uesc.br/lec/download/ivan/pacotes/EDM/imagens/qfig2.png)


## Saving the questions in the correct directory
After elaborating a question, the file must be saved in the correct directory so that the application can find such files. Let's assume you created your question bank (IBA for example), your subject (estatistica_basica) and a subject (introduction). Assuming that the question is of an objective and easy level, then the file "minhaquestao.Rnw" should be saved in the directory:

* In the case of Windows
    * C:\\users\\ivan\\Documents\\R\\win-library\\4.0\\EDM\\questionbank\\brazil\\IBA\\estatistica_basica\\introduction\\objective\\facil\\minhaquestao.Rnw
* In the case of Linux
    * /home/ivan/R/x86_64-pc-linux-gnu-library/4.0/EDM/questionbank/brazil/IBA/estatistica_basica/introducao/objetiva/facil/minhaquestao.Rnw

Don't forget to name the files properly. See the topic [Standardizing file names](https://github.com/ivanalaman/questionbankEDM#Standardizing-file-names).
