mgsub <- function(pattern, replacement, x, ...) {
  if (length(pattern)!=length(replacement)) {
    stop("pattern and replacement do not have the same length.")
  }
  result <- x
  for (i in 1:length(pattern)) {
    result <- gsub(pattern[i], replacement[i], result, ...)
  }
  result
}

list.dirss <- function(path=".", pattern=NULL, all.dirs=FALSE,
                       full.names=FALSE, ignore.case=FALSE) {
  # use full.names=TRUE to pass to file.info
  all <- list.files(path, pattern, all.dirs,
                    full.names=TRUE, recursive=FALSE, ignore.case)
  dirs <- all[file.info(all)$isdir]
  # determine whether to return full names or just dir names
  if(isTRUE(full.names))
    return(dirs)
  else
    return(basename(dirs))
}   

new_widget <- function(namefil, your_name,i=i){

  if(i==1){
  aux_widg <- file('../../aux_files/widgets/mirror/widgets_default.r','r+')
  on.exit(close(aux_widg))
  old_widg <- readLines(aux_widg)
  old_widg1 <- append(old_widg,',',after=0)
  new_widg1 <- gsub('acz',namefil,old_widg1)
  new_widg2 <- gsub('Achim Zeileis',your_name,new_widg1)
  cat(new_widg2,file='../../aux_files/widgets/temp/new_Widget.r',sep='\n')
 } else {
  pos <- 1 + 9*(i-1)
  aux_widg <- file('../../aux_files/widgets/mirror/widgets_default.r','r+')
  on.exit(close(aux_widg))
  old_widg <- readLines(aux_widg)
  old_widg1 <- append(old_widg,',',after=0)
  new_widg1 <- gsub('acz',namefil,old_widg1)
  new_widg2 <- gsub('Achim Zeileis',your_name,new_widg1)

  cur_widg <- file('../../aux_files/widgets/temp/new_Widget.r','r+')
  on.exit(close(cur_widg))
  old_widgc <- readLines(cur_widg)
  next_widg <- append(old_widgc,new_widg2,after=pos+1)
  cat(next_widg,file='../../aux_files/widgets/temp/new_Widget.r',sep='\n')
 }
}

new_questiont <- function(namefil, your_name, namedir, namecou,i=i){

if(i==1){
  aux_qt <- file('../../aux_files/widgets/mirror/question_teacher_default.r','r+')
  on.exit(close(aux_qt))
  old_qt <- readLines(aux_qt)
  new_qt <- gsub('acz',namefil,old_qt)
  new_qtt <- gsub('ACZ',namedir,new_qt)
  new_qt1 <- gsub('Achim Zeileis',your_name,new_qtt)
  new_qt11 <- gsub('austria',namecou,new_qt1) 
  cat(new_qt11,file='../../aux_files/widgets/temp/new_questiont.r',sep='\n')
}else{
  pos <- 1 + 39*(i-1)
  aux_qt <- file('../../aux_files/widgets/mirror/question_teacher_default.r','r+')
  on.exit(close(aux_qt))
  old_qt <- readLines(aux_qt)
  new_qt <- gsub('acz',namefil,old_qt)
  new_qtt <- gsub('ACZ',namedir,new_qt)
  new_qt1 <- gsub('Achim Zeileis',your_name,new_qtt)
  new_qt11 <- gsub('austria',namecou,new_qt1)
  
  cur_widgt <- file('../../aux_files/widgets/temp/new_questiont.r','r+')
  on.exit(close(cur_widgt))
  old_widgct <- readLines(cur_widgt)
  next_widgt <- append(old_widgct,new_qt11,after=pos+1)
  cat(next_widgt,file='../../aux_files/widgets/temp/new_questiont.r',sep='\n')
 }
}                                              

new_remove_widgets <- function(namefil, your_name,i=i){
  
  if(i==1){
  aux_re <- file('../../aux_files/widgets/mirror/remove_widgets_default.r','r+')
  on.exit(close(aux_re))  
  old_re <- readLines(aux_re)
  old_re1 <- append(old_re,',',after=0) 
  new_re <- gsub('acz',namefil,old_re1)
  new_re1 <- gsub('Achim Zeileis',your_name,new_re)
  cat(new_re1,file='../../aux_files/widgets/temp/new_remove_widgets.r',sep='\n')
  }else{
   pos <- 1 + 5*(i-1)
   aux_re <- file('../../aux_files/widgets/mirror/remove_widgets_default.r','r+')
   on.exit(close(aux_re))  
   old_re <- readLines(aux_re)
   old_re1 <- append(old_re,',',after=0) 
   new_re <- gsub('acz',namefil,old_re1)
   new_re1 <- gsub('Achim Zeileis',your_name,new_re)
   
   cur_re <- file('../../aux_files/widgets/temp/new_remove_widgets.r','r+')
   on.exit(close(cur_re))
   old_curre <- readLines(cur_re)
   next_curre <- append(old_curre,new_re1,after=pos+1)
   cat(next_curre,file='../../aux_files/widgets/temp/new_remove_widgets.r',sep='\n') 
  }
}


load("../../aux_files/other/translation.bin") 
