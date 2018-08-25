load("C:/Users/dell/Desktop/BIBM_B231/bibm_2015_code/step1_MSGL/Result_MSGL.RData")

# miRNA-mRNA regulatory matrix

rat = length(which(BETA!=0))/(dim(BETA)[1]*dim(BETA)[2])

# rat = 1.7%???? error