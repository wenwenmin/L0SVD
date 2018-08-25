setwd("C:/Users/dell/Desktop/BIBM_B231/bibm_2015_code")

load("C:/Users/dell/Desktop/BIBM_B231/bibm_2015_code/step1_MSGL/Data_BRCA_PPI_filter/col.BRCA.RData")
#load miRNA/mRNA expression data
E = read.table("Data_BRCA_PPI_filter/geneExpMatrix.txt")
P = read.table("Data_BRCA_PPI_filter/mirExpMatrix.txt")
# load miRNA cluster data
group = read.table("Data_BRCA_PPI_filter/BRCA_group.txt")

gene.names=read.table("Data_BRCA_PPI_filter/geneNames.txt" ,sep = " ")
mir.names=read.table("Data_BRCA_PPI_filter/miRNANames.txt" ,sep = " ")

# -----------------------------
mir.names.group <- as.character(mir.names[group[,2],1]) #as.factor mir.names.group[1])

temp<-t(P)

miRExp <- temp[,group[,2]]

colnames(miRExp) = mir.names.group
row.names(miRExp) = as.character(sample.pheno.subtype[,1])

# -----------------------------
geneExp <- t(E)

gene.names <- as.character(gene.names[1:length(gene.names[,1]),1])
colnames(geneExp) =  gene.names
row.names(geneExp) = as.character(sample.pheno.subtype[,1])

sample.subtype = sample.pheno.subtype
# ------------------------
miR.group.index <- c(group[,1])

save(miRExp,geneExp,miR.group.index,file = "step1_MSGL/BRCA_DATA.RData")





