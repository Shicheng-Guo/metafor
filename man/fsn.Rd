\name{fsn}
\alias{fsn}
\title{Fail-Safe N Analysis (File Drawer Analysis)}
\description{
   Function to compute the fail-safe N (also called a file drawer analysis).
}
\usage{
fsn(yi, vi, sei, data, type="Rosenthal", alpha=.05,
    target, weighted=FALSE, subset, digits, \dots)
}
\arguments{
   \item{yi}{vector with the observed effect sizes or outcomes.}
   \item{vi}{vector with the corresponding sampling variances.}
   \item{sei}{vector with the corresponding standard errors (note: only one of the two, \code{vi} or \code{sei}, needs to be specified).}
   \item{data}{optional data frame containing the variables given to the arguments above.}
   \item{type}{character string indicating the method to use for the calculation of the fail-safe N. Possible options are \code{"Rosenthal"}, \code{"Orwin"}, or \code{"Rosenberg"}. See \sQuote{Details}.}
   \item{alpha}{target alpha level to use for the Rosenthal and Rosenberg methods (the default is .05).}
   \item{target}{target average effect size to use for the Orwin method. If undefined, then the target average effect size will be equal to the observed average effect size divided by 2.}
   \item{weighted}{logical indicating whether Orwin's method should be based on unweighted (the default) or weighted averages.}
   \item{subset}{optional (logical or numeric) vector indicating the subset of studies that should be used for the calculations.}
   \item{digits}{integer specifying the number of decimal places to which the printed results should be rounded (if unspecified, the default is 4).}
   \item{\dots}{other arguments.}
}
\details{
   The function can be used in conjunction with any of the usual effect sizes / outcome measures used in meta-analyses (e.g., log risk ratios, log odds ratios, risk differences, mean differences, standardized mean differences, raw correlation coefficients, correlation coefficients transformed with Fisher's r-to-z transformation, and so on). Simply specify the observed effect sizes or outcomes via the \code{yi} argument and the corresponding sampling variances via the \code{vi} argument (instead of specifying \code{vi}, one can specify the standard errors via the \code{sei} argument). The \code{\link{escalc}} function can be used to compute a wide variety of effect sizes / outcome measures (and the corresponding sampling variances) based on summary statistics.

   The Rosenthal method (sometimes called a \sQuote{file drawer analysis}) calculates the number of studies averaging null results that would have to be added to the given set of observed effect sizes or outcomes to reduce the combined significance level (p-value) to a target alpha level (e.g., .05). The calculation is based on Stouffer's method to combine p-values and is described in Rosenthal (1979).

   The Orwin method calculates the number of studies averaging null results that would have to be added to the given set of observed effect sizes or outcomes to reduce the (unweighted or weighted) average effect size to a target effect size. The method is described in Orwin (1983). If \code{weighted=FALSE} (the default), the method does not require (or makes use) of \code{vi} or \code{sei}, so these arguments are not relevant for this method.

   The Rosenberg method calculates the number of studies averaging null results that would have to be added to the given set of observed effect sizes or outcomes to reduce significance level (p-value) of the (weighted) average effect size (based on a fixed-effects model) to a target alpha level (e.g., .05). The method is described in Rosenberg (2005).
}
\value{
   An object of class \code{"fsn"}. The object is a list containing the following components:
   \item{type}{the method used.}
   \item{fsnum}{the calculated fail-safe N.}
   \item{alpha}{the target alpha level.}
   \item{pval}{the p-value of the observed results. \code{NA} for the Orwin method.}
   \item{meanes}{the average effect size of the observed results. \code{NA} for the Rosenthal method.}
   \item{target}{the target effect size. \code{NA} for the Rosenthal and Rosenberg methods.}

   The results are formatted and printed with the \code{\link{print.fsn}} function.
}
\note{
   For the Rosenberg method, the p-value is calculated based on a standard normal distribution (instead of a t-distribution, as suggested by Rosenberg, 2005).
}
\author{
   Wolfgang Viechtbauer \email{wvb@metafor-project.org} \url{http://www.metafor-project.org}
}
\references{
   Rosenthal, R. (1979). The "file drawer problem" and tolerance for null results. \emph{Psychological Bulletin}, \bold{86}(3), 638--641. \verb{https://doi.org/10.1037/0033-2909.86.3.638}

   Orwin, R. G. (1983). A fail-safe N for effect size in meta-analysis. \emph{Journal of Educational Statistics}, \bold{8}(2), 157--159. \verb{https://doi.org/10.3102/10769986008002157}

   Rosenberg, M. S. (2005). The file-drawer problem revisited: A general weighted method for calculating fail-safe numbers in meta-analysis. \emph{Evolution}, \bold{59}(2), 464--468. \verb{https://doi.org/10.1111/j.0014-3820.2005.tb01004.x}

   Viechtbauer, W. (2010). Conducting meta-analyses in R with the metafor package. \emph{Journal of Statistical Software}, \bold{36}(3), 1--48. \verb{https://doi.org/10.18637/jss.v036.i03}
}
\seealso{
   \code{\link{ranktest}}, \code{\link{regtest}}, \code{\link{trimfill}}
}
\examples{
### calculate log risk ratios and corresponding sampling variances
dat <- escalc(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

fsn(yi, vi, data=dat)
fsn(yi, data=dat, type="Orwin")
fsn(yi, vi, data=dat, type="Orwin", weighted=TRUE)
fsn(yi, vi, data=dat, type="Rosenberg")
}
\keyword{htest}
