% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/buildmer.R
\name{buildmer}
\alias{buildmer}
\title{Use \code{buildmer} to fit mixed-effects models using \code{lmer}/\code{glmer} from \code{lme4}}
\usage{
buildmer(
  formula,
  data = NULL,
  family = gaussian(),
  buildmerControl = buildmerControl(),
  ...
)
}
\arguments{
\item{formula}{See the general documentation under \code{\link{buildmer-package}}}

\item{data}{See the general documentation under \code{\link{buildmer-package}}}

\item{family}{See the general documentation under \code{\link{buildmer-package}}}

\item{buildmerControl}{Control arguments for buildmer --- see the general documentation under \code{\link{buildmerControl}}}

\item{...}{Additional options to be passed to \code{lmer}, \code{glmer}, or \code{gamm4}. (They will also be passed to \code{(g)lm} in so far as they're applicable, so you can use arguments like \code{subset=...} and expect things to work. The single exception is the \code{control} argument, which is assumed to be meant only for \code{lme4} and not for \code{(g)lm}, and will \emph{not} be passed on to \code{(g)lm}). For backward-compatibility reasons, will also accept buildmer control parameters, although those specified in \code{buildmerControl} will take precedence.}
}
\description{
Use \code{buildmer} to fit mixed-effects models using \code{lmer}/\code{glmer} from \code{lme4}
}
\examples{
library(buildmer)
model <- buildmer(Reaction ~ Days + (Days|Subject),lme4::sleepstudy)

# Tests from github issue #2, that also show the use of the 'direction' and 'crit' parameters:
bm.test <- buildmer(cbind(incidence,size - incidence) ~ period + (1 | herd),
	family=binomial,data=lme4::cbpp)
bm.test <- buildmer(cbind(incidence,size - incidence) ~ period + (1 | herd),
	family=binomial,data=lme4::cbpp,buildmerControl=buildmerControl(direction='forward'))
bm.test <- buildmer(cbind(incidence,size - incidence) ~ period + (1 | herd),
	family=binomial,data=lme4::cbpp,buildmerControl=buildmerControl(crit='AIC'))
bm.test <- buildmer(cbind(incidence,size - incidence) ~ period + (1 | herd),
	family=binomial,data=lme4::cbpp,
	buildmerControl=buildmerControl(direction='forward',crit='AIC'))
}
