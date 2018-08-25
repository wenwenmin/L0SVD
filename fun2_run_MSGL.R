ptm <- proc.time()

setwd("C:/Users/dell/Desktop/BIBM_B231/bibm_2015_code/step1_MSGL")
load("Data/BRCA_DATA.RData")

# library a R package 
# install.packages("SGL")
require("SGL")
source('Multi.SGL.R')

# ------------------------------
# Run MSGL model for infering miRNA-mRNA regulatory network
# Set your parameters 
lambdas = 0.01
gamma = 0.5
alpha = 0.95  #alpha = 0.95
  
BETA = Multi.SGL(miRExp, geneExp, miR.group.index, lambdas, gamma)

row.names(BETA) = colnames(miRExp)
colnames(BETA) =  colnames(geneExp)

# Output the result
# write.table(BETA,"BRCA_BETA_ppi_filter.txt",row.names = F,col.names = F)

time = proc.time() - ptm

save.image("Result/Result_MSGL.RData")