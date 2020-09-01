### EDM

This is the development code of the R package **EDM**.
You should use it if you want to contribute to its development:
testing unreleased versions, fixing bugs, writing code, etc.

Before installing the **EDM** package, we advise you to install LaTeX, so that it is possible to generate it as PDF tests. For Windows users, install the Rtools program. This tool will help to compile the package correctly.

To download, check and build it do the following in a terminal emulator:

> git clone  git://github.com/ivanalaman/EDM.git

> or

> git clone https://ivanalaman@github.com/EDM.git

After to clone it, to check, build and install do the following:
> R CMD check EDM

> R CMD build EDM

> R CMD INSTALL EDM_X.X-X.tar.gz

Or, you can install using devtools package as:

> library(devtools)

> install_github("ivanalaman/EDM",upgrade="never",force=TRUE) 
