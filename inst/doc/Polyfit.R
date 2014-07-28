### R code from vignette source 'Polyfit.Rnw'

###################################################
### code chunk number 1: Polyfit.Rnw:40-41
###################################################
library(Polyfit)


###################################################
### code chunk number 2: Polyfit.Rnw:84-91
###################################################
cds <- makeExampleCountDataSet()
cds <- estimateSizeFactors( cds )
cds <- estimateDispersions( cds )
nbT <- nbinomTest( cds, "A", "B" )
pValuesDESeq <- nbT$pval # <-- Original DESeq code
nbTPolyfit <- pfNbinomTest( cds, "A", "B" )
pValuesPFDESeq <- nbTPolyfit$pval # <-- Polyfit replacement


###################################################
### code chunk number 3: fig2plot
###################################################
oldpar <- par(mfrow=c(1,2))
hist(pValuesDESeq,breaks=seq(0,1,by=0.01), 
       		xlab="P-value", main="DESeq")
hist(pValuesPFDESeq,breaks=seq(0,1,by=0.01), 
 					xlab="P-value", main="polyfit-DESeq")
par(oldpar)


###################################################
### code chunk number 4: fig2
###################################################
oldpar <- par(mfrow=c(1,2))
hist(pValuesDESeq,breaks=seq(0,1,by=0.01), 
       		xlab="P-value", main="DESeq")
hist(pValuesPFDESeq,breaks=seq(0,1,by=0.01), 
 					xlab="P-value", main="polyfit-DESeq")
par(oldpar)


###################################################
### code chunk number 5: Polyfit.Rnw:160-166
###################################################
lP <- levelPValues(pValuesPFDESeq)
outTable <- cbind(origPval= pValuesPFDESeq, 
                  levelledPval=lP$pValueCorr, 
                  levelledQval=lP$qValueCorr, 
                  BH_Qval=lP$qValueCorrBH)
head(outTable)


###################################################
### code chunk number 6: fig5plot
###################################################
lP <- levelPValues(pValuesPFDESeq, plot=TRUE)


###################################################
### code chunk number 7: fig5
###################################################
lP <- levelPValues(pValuesPFDESeq, plot=TRUE)


