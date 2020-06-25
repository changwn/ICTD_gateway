## ICTD: A semi-supervised cell type identification and deconvolution method for multi-omics data

We developed a novel deconvolution method, namely Inference of Cell Types and Deconvolution (ICTD) that addresses the fundamental issue of identifiability and robustness in current tissue data deconvolution problem. ICTD provides substantially new capabilities for omics data based characterization of a tissue microenvironment, including (1) maximizing the resolution in identifying resident cell and sub types that truly exists in a tissue, (2) identifying the most reliable marker genes for each cell type, which are tissue and data set specific, (3) handling the stability problem with co-linear cell types, (4) co-deconvoluting with available matched multi-omics data, and (5) inferring functional variations specific to one or several cell types. ICTD is empowered by (i) rigorously derived mathematical conditions of identifiable cell type and cell type specific functions in tissue transcriptomics data and (ii) a semi supervised approach to maximize the knowledge transfer of cell type and functional marker genes identified in single cell or bulk cell data in the analysis of tissue data, and (iii) a novel unsupervised approach to minimize the bias brought by training data. Application of ICTD on real and single cell simulated tissue data validated that the method has consistently good performance for tissue data coming from different species, tissue microenvironments, and experimental platforms. Other than the new capabilities, ICTD outperformed other state-of-the-art devolution methods on prediction accuracy, the resolution of identifiable cell, detection of unknown sub cell types, and assessment of cell type specific functions. The premise of ICTD also lies in characterizing cell-cell interactions and discovering cell types and prognostic markers that are predictive of clinical outcomes.
<center>

<div align=center><img width="1200" height="1000" src="https://github.com/changwn/ICTD/blob/master/img/fig1.png"/></div>
</center>  



## Requirements and Installation

ICTD is implemented by R.

The dependency of the ICTD please refer to DESCRIPTION file of the package [here](https://github.com/changwn/ICTD/blob/master/DESCRIPTION).

The additional dependency package for bigred 3.
- [optparse](https://CRAN.R-project.org/package=optparse )


Instruction for installation please refer to package [manual](https://github.com/changwn/ICTD).


## Usage
You can see the input arguments for ICTD by help option:

```
usage: ICTD_bigred.r [-h][--data_dir <data_directory>]
                [--test_file TEST_FILE] [--res_dir <data_directory>][--out OUT_FILE]
            

ICTD: A semi-supervised cell type identification and deconvolution method for multi-omics data

optional arguments:
  -h, --help            show this help message and exit
  -d, --data_dir <data_directory>
                        The data directory for training and prediction
  -t, --test_file TEST_FILE
                        The test RNA file
  -r, --res_dir <res_directory>
                        The data directory for save res
  -o, --out 
                        The output file name
```

### Input File Format
The input of ICTD is RNAseq as csv format. Normalization is not required. 

- row: genes.
- column: samples.

Mind: In csv file, the first row (colname) has one fewer element than other rows.

### Run ICTD on bigred3@IU

```
module load r/3.4.4
Rscript ICTD_bigred.r --data_dir data --res_dir res --out out.csv

```

### Questions & Problems

If you have any questions or problems when using ICTD, please feel free to open a new issue [here](https://github.com/zy26/ICTD/issues). We will fix the new issue ASAP.  You can also email the maintainers and authors below.

- [Wennan Chang](https://changwn.github.io/)
(wnchang@iu.edu)

PhD candidate at BDR group, Indiana University School of Medicine

- [Chi Zhang](https://medicine.iu.edu/departments/genetics/faculty/27057/zhang-chi/)
(czhang87@iu.edu)

Assistant Professor

Department of Medical & Molecular Genetics, Indiana University School of Medicine



### R shiny Example
![[image]](https://github.com/changwn/ICTD/blob/master/img/web_app.png)
