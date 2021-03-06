% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rcpme.R
\name{rcpme}
\alias{rcpme}
\title{Random Change Point Mixed Model}
\usage{
rcpme(
  longdata,
  formu,
  covariate = "NULL",
  REadjust = "no",
  gamma = 0.1,
  nbnodes = 10,
  param = NULL,
  model = "test",
  link = "linear",
  statut = NULL,
  latent = FALSE,
  classprob = NULL
)
}
\arguments{
\item{longdata}{A longitudinal dataset containing all variables used in the formula \code{formu}}

\item{formu}{A formula object describing which variables are to be used. The formula has to be of the following form \code{markervar ~ scorevar | groupvar} for the function to work.}

\item{covariate}{An optional string indicating a binary covariate to add on the fixed effects, i.e. intercept, mean slope, difference of slopes and changepoint date. The parameter \code{REadjust} indicates how this covariate influences the random effects variance structure. Default to NULL, i.e. no covariates.}

\item{REadjust}{An optional string value indicating how the random effects variance structure depends on \code{covariate}. "no" means that the structure doesn't depend upon \code{covariate}. "prop" indicates that the random effects variance structure is proportional according to \code{covariate} value. "yes" indicates that there is two different random effects variance structures, i.e. one for each level of \code{covariate}. Default to "no".}

\item{gamma}{A numeric parameter indicating how smooth the trajectory is on the changepoint date. It should be small according to the time variable scale. Default to 0.1.}

\item{nbnodes}{A numeric parameter indicating how many nodes are to be used for the gaussian quadrature for numerical integration. Default to 10.}

\item{param}{An optional vector parameter that contains initial parameter for the optimization of the log-likelihood. Default to NULL.}

\item{model}{An optional string indicating which formulation of the random changepoint exists. The first model, `test`, is \eqn{Y_ij = \beta_{0i} + \beta_{1i}t_{ij} + \beta_{2i}\sqrt{(t_{ij}-\tau_i)^2+\gamma} + \epsilon_{ij}} used by the `testRCPMM` function. The second is `bw` for the Bacon-Watts formulation of the model \eqn{Y_ij = \beta_{0i} + \beta_{1i}(t_{ij}-\tau_i) + \beta_{2i}\sqrt{(t_{ij}-\tau_i)^2+\gamma} + \epsilon_{ij}}. The third option is `isplines` for the I-spline model. When used for estimation purpose, you should either `bw` or `isplines` which has clear interpretability properties. Default to `bw`}

\item{link}{An optional string indicating which link function is to be used. This link function is used to deal with non-gaussian data. With `link=splines` the model estimates an appropriate I-spline link function `g` so that `g(scorevar)` is a gaussian variable. If data is already gaussian, you can chose `link=linear` so that no link function will be estimated. Default to `linear`.}

\item{statut}{An optional string indicating a binary variable from which two class are considered: a linear class for subjects with \code{statut=0} and a random changepoint class for subjects with \code{statut=1}. Default to NULL.}
}
\value{
The output contains several objects : \code{call} is the function call; \code{loglik} is the value of the log-likelihood at the optimum; \code{formula} is the formula describing which variables are used in the model; \code{fixed} contains all fixed parameters estimates, standard errors, CIs, wald test statistic and corresponding pvalue when possible; \code{sdres} the estimated residual error; \code{VarEA} a 4x4 matrix or a list of 4x4 matrices - if there is some covariate for example - containing the estimated random effects covariance matrix; \code{optpar} the optimal parameters maximizing the log-likelihood; \code{covariate} the covariate declared in the function call; \code{REadjust} the string indicating how random effects structure is handled as declared in the function call, \code{invhessian} the covariance matrix containing all the standard errors and correlations of the parameter estimates; \code{conv} an index of successful convergance, equals to 1 if success; \code{init} the initial values vector; \code{model} the model used during estimation; \code{gamma} the value of gamma used during estimation; \code{link} the link function used during estimation.
}
\description{
Random Change Point Mixed Model
}
