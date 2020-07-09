
#!/usr/bin/env Rscript
lib_dir = paste(getwd(), "lib", sep="/")

if (!require('optparse',lib.loc =lib_dir)) {
  install.packages("optparse", repo="http://cran.rstudio.com/",lib=lib_dir)
  library("optparse", lib=lib_dir)
}
if (!require('devtools')) {
  install.packages("devtools", lib=lib_dir)
  library("devtools",lib=lib_dir)
}
 
option_list = list(
#	make_option(c("-f", "--file"), type="character", default=NULL, 
#              help="dataset file name", metavar="character"),
	make_option(c("-d", "--data_dir"), type="character", default="data", 
              help="The input data directory", metavar="<data_directory>"),
	make_option(c("-t", "--test_file"), type="character", default="test_bulk.csv", 
              help="The test RNA file", metavar="character"),
	make_option(c("-r", "--res_dir"), type="character", default="res", 
              help="The result directory", metavar="<result_directory>"),
	make_option(c("-o", "--out"), type="character", default="out.csv", 
              help="output file name [default= %default]", metavar="character")
); 
 
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

#if (is.null(opt$file)){
#  print_help(opt_parser)
#  stop("At least one argument must be supplied (input file).n", call.=FALSE)
#}


#--------read input data-------------------------
inputFile = paste(opt$data_dir, opt$test_file, sep='/')
#print(inputFile)
#print(getwd())
data_bulk = read.csv(inputFile) #careful: the first row (colname) has one fewer element than other rows.


library("biclust", lib=lib_dir)
library("bcv",lib=lib_dir)
#---------run ICTD function----------------------
if (!require('ICTD',lib=lib_dir)) {
  #install ICTD
  withr::with_libpaths(new="./", install_github('changwn/ICTD'))

  #load ICTD
  library("ICTD",lib=lib_dir)
}
ictd_result <- ICTD(data_bulk)
ictd_proportion <- ictd_result[[1]]
print("ICTD_done")

#---------output to user defined directory-------
outputFile = paste(opt$res_dir, opt$out, sep='/')
#print(outputFile)
write.csv(ictd_proportion, row.names = TRUE, file = outputFile)
