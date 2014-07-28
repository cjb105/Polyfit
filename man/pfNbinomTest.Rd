\name{pfNbinomTest}
\alias{pfNbinomTest}
\alias{pfNbinomTestForMatrices}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
The Polyfit extension to the DESeq functions nbinomTest() and nbinomTestForMatrices()
}
\description{
Polyfit extensions to the DESeq functions \code{\link{nbinomTest}} and \code{\link{nbinomTestForMatrices}} which test for differences between the base means of two conditions (i.e., for differential expression in the case of RNA-Seq).
}
\usage{
pfNbinomTest(cds, condA, condB, pvals_only = FALSE, eps = NULL)
pfNbinomTestForMatrices(countsA, countsB, sizeFactorsA, sizeFactorsB, dispsA, dispsB )
}
\arguments{
  \item{cds}{
a CountDataSet with size factors and raw variance functions
}
  \item{condA}{
one of the conditions in 'cds'
}
  \item{condB}{
another one of the conditions in 'cds'
}
  \item{pvals_only}{
return only a vector of (unadjusted) p values instead of the data frame described below
}
  \item{eps}{
This argument is no longer used. Do not use it
}
  \item{countsA}{ 
     A matrix of counts, where each column is a replicate
}
  \item{countsB}{
     Another matrix of counts, where each column is a replicate}
  \item{sizeFactorsA}{
     Size factors for the columns of the matrix 'countsA'
}
  \item{sizeFactorsB}{
     Size factors for the columns of the matrix 'countsB'
}
  \item{dispsA}{
     The dispersions for 'countsA', a vector with one value per gene
}
  \item{dispsB}{
     The same for 'countsB'
}
}
\details{
These functions have the same behaviour as the DESeq functions \code{\link{nbinomTest}} and \code{\link{nbinomTestForMatrices}}, except that the `flagpole' in the P-value histogram, particularly at p = 1 is redistributed using the function \code{\link{twoSidedPValueFromDiscrete}}.
}
\value{
\code{pfNbinomTest} gives a data frame with the following columns:
\item{id}{The ID of the observable, taken from the row names of the counts slots.}
\item{baseMean}{The base mean (i.e., mean of the counts divided by the size factors) for the counts 
for both conditions}
\item{baseMeanA}{The base mean (i.e., mean of the counts divided by the size factors) for the counts 
for condition A}
\item{baseMeanB}{The base mean for condition B}
\item{foldChange}{The ratio meanB/meanA}
\item{log2FoldChange}{The log2 of the fold change}
\item{pval}{The p value for rejecting the null hypothesis 'meanA==meanB'}
\item{padj}{The adjusted p values (adjusted with 'p.adjust( pval, method="BH")')}
\code{pfNbinomTestForMatrices} gives a vector of unadjusted p values, one for each row in the counts matrices. 
}
\references{
Burden, C.J., Qureshi, S. and Wilson, S.R. (2014). \emph{Error estimates for the 
analysis of differential expression from RNA-seq count data}, PeerJ PrePrints 2:e400v1. 

Anders, S. and Huber, W. (2010). \emph{Differential expression analysis for sequence count data.} Genome Biology, \bold{11}(10), R106.
}
\author{
Conrad Burden, conrad.burden@anu.edu.au, based on software by Simon Anders
}
\examples{
cds <- makeExampleCountDataSet()
cds <- estimateSizeFactors( cds )
cds <- estimateDispersions( cds )
nbT <- nbinomTest( cds, "A", "B" )
head( nbT )
nbTPolyfit <- pfNbinomTest( cds, "A", "B" )
head( nbTPolyfit )

oldpar <- par(mfrow=c(1,2))
hist(nbT$pval,breaks=seq(0,1,by=0.01), 
   				xlab="P-value", main="DESeq")
hist(nbTPolyfit$pval,breaks=seq(0,1,by=0.01), 
 					xlab="P-value", main="polyfit-DESeq")
par(oldpar)
}
