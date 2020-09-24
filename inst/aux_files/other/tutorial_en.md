# TUTORIAL

Welcome to the question bank manager!

The reading of this tutorial is important because we want to clarify some points that we consider pertinent for the good use of the manager.

## Creating a question bank

This menu is intended for those who do not yet have a bank of questions and would like to start contributing their questions. Note that in the first step you must enter your full name and an acronym that will represent your bank. This acronym should contain only three uppercase letters for standardization of the application. If your acronym coincides with others already created, an alert will be triggered warning you to change them.

In the second step, you must choose a _discipline_ and a _subject_ of this discipline. Avoid accents or any type of character when creating the subject / discipline. Follow the suggested example.

Then click the **GENERATE BANK!** button so that your base is generated and all other files for the application to recognize its base. Soon after you close the application and restart it again so that your base is recognized.

## Creating a new subject/subject

In this menu the user can create new disciplines or subjects related to a discipline that has already been created. For a good functioning of the application, every time you create a new discipline, create at least one subject related to this discipline.

A new discipline or subject will be created each time you click on the button "GENERATE DISCIPLINE" or "GENERATE SUBJECT" respectively. Again, for you to view the disciplines created in the subject-building column, you must restart the application.

It is important that the disciplines/subjects created are in lowercase letters. If the name is composed, separate it with *underline* (\_). Avoid accents, special characters, and more.

## Making a quizz

Once you've created your issue bank, you can start scheduling your first question.

In this menu there are two options. Interactive and Non-interactive.

1. Interactive
   * It is for those who have no knowledge of LaTeX. The user must follow the example suggested in each question. I tried to be as intuitive as possible. After filling in the fields and pressing the save button, a file with the name "myfile.Rnw" will be saved in your system's default folder (usually the *download* folder). You should copy the file into your question bank and edit it if you want, to correct any accentuation problems for example. Read the text on the link https://github.com/ivanalaman/questionbankEDM/tree/master/lang/portuguese_br for more details.

2. Not interactive
   * It is for those who have some knowledge in LaTeX. In this case, for each type of question the source code will be presented. The user must follow the suggested example. A file named "myfile.Rnw" will be saved in your system's default folder (usually the * download * folder). You must copy the file into your question bank. Read the text on the link https://github.com/ivanalaman/questionbankEDM/tree/master/lang/portuguese_br for more details.

Realize that the questions must have a pattern. This pattern is followed by the [exams](https://cran.r-project.org/web/packages/exams/index.html) package. Therefore, although the application tries to minimize your effort to ask a question, we advise you to visit the official website of the [exams](https://cran.r-project.org/web/packages/exams/index.html) package http://www.r-exams.org/ for deeper knowledge.

## Use question bank

Now we are ready to use the application.

In the first column from left to right, edit your test/exercise header.

In the second column you will choose how many tests/exercises you want to generate. For example, if in my classroom there are 10 students, then I will generate 10 files, one for each student. Then, you will choose from which question bank (s) will be composed the question (s) of your test/exercise. After choosing the bank (s) you can choose which question (s) will be part of your evaluation. If you want to see the file before, just right click on the file, and click the *copy link address*, and paste in the browser.

## Updating the question bank

The great goal of the application is that you have a bank of questions not only with your questions but also with other teachers. So, if you want to update your bank with questions from other teachers click on the menu *Update question bank!* And then on the *Update* button.

At the moment there is no distinction of country, subjects and disciplines. Therefore, updating the question bank will involve downloading all the files that will be on the server.

## Other recommendations

Avoid copying the issue of a bank and put it in your database, as this will double the issues and the idea is not this. If there is anything wrong with the question of a basis that is not yours, send an email to the maintainer of the question bank that will be in the file **REGISTRATION.md** in the https://github.com/ivanalaman/questionbankEDM repository.

Do as the author of the application, be **supportive**, **share**. When placing some questions in your base, send your compress file to email iballaman@uesc.br. After reviewing the file, your question bank will be placed in the https://github.com/ivanalaman/questionbankEDM repository so that other users can access and can also use your questions.

If there is any bug in the application and you do not have enough programming intimacy to correct it, send an email to iballaman@uesc.br and report the bug so it can be fixed.
