\name{twoSidedPValueFromDiscrete}
\alias{twoSidedPValueFromDiscrete}
\title{
Two sided P-value from discrete distribution
}
\description{
Function to calculate a 2-sided p-value of an observation \eqn{xobs} for a finite discrete distribution
\deqn{Prob(X = xobs) = probs[xobs + 1]}
over the range \eqn{xobs} in \eqn{(0, 1, ..., xmax)} by "squaring off" the distribution to a continuous distribution}
\usage{
twoSidedPValueFromDiscrete(probs, xobs)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{probs}{
an array containing the probabilities that \eqn{X} takes the values \eqn{0, 1, ..., xmax} 
}
  \item{xobs}{
a single observed value of X
}
}
\details{
Note that the returned 2-sided p-value contains a random component, i.e. a given set of input parameters returns a different result each run
}
\value{
A real valued randomised p-value between 0 and 1. If \eqn{xobs} is generated with randomly with probability \eqn{probs[xobs + 1]} the returned value will be uniformly distributed on the interval [0, 1].    
}
\author{
Conrad Burden
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\examples{
pr <- dbinom(0:5,size=5,prob=0.4)
xSample <- rbinom(10000,size=5,prob=0.4)
pvalues <- c()
for(x in xSample){
  pvalues <- c(pvalues, twoSidedPValueFromDiscrete(pr,x))
	}
hist(pvalues)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
