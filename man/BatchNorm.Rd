% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BatchNorm.R
\name{BatchNorm}
\alias{BatchNorm}
\title{Batch Normalization}
\source{
https://arxiv.org/abs/1502.03167 / MIT
}
\description{
Avoid internal covariate shift by
standardizing input values for each mini batch,
meaning that the scale of the inputs remain the same
regardless of how the weights in the previous layer
changes.
}
\note{
work in progress
}
\seealso{
Other architecture: 
\code{\link{Linear}},
\code{\link{Sequential}}
}
\concept{architecture}
\section{Super class}{
\code{\link[neuralnetr:ClassModule]{neuralnetr::ClassModule}} -> \code{BatchNorm}
}
\section{Public fields}{
\if{html}{\out{<div class="r6-fields">}}
\describe{
\item{\code{eps}}{small constant avoid division by zero.}

\item{\code{m}}{number of input channels}

\item{\code{B}}{weights (nl × 1 vector)}

\item{\code{G}}{weights (nl × 1 vector)}

\item{\code{A}}{m x K: m input channels and mini-batch size K}

\item{\code{K}}{mini-batch size.}

\item{\code{mus}}{batch-wise means.}

\item{\code{vars}}{batch-wise variances.}

\item{\code{batch-wise}}{normalized inputs using input, mus, vars and eps.}
}
\if{html}{\out{</div>}}
}
\section{Active bindings}{
\if{html}{\out{<div class="r6-active-bindings">}}
\describe{
\item{\code{batch-wise}}{normalized inputs using input, mus, vars and eps.}
}
\if{html}{\out{</div>}}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-new}{\code{BatchNorm$new()}}
\item \href{#method-forward}{\code{BatchNorm$forward()}}
\item \href{#method-backward}{\code{BatchNorm$backward()}}
\item \href{#method-step}{\code{BatchNorm$step()}}
\item \href{#method-clone}{\code{BatchNorm$clone()}}
}
}
\if{html}{
\out{<details open ><summary>Inherited methods</summary>}
\itemize{
\item \out{<span class="pkg-link" data-pkg="neuralnetr" data-topic="ClassModule" data-id="sgd_step">}\href{../../neuralnetr/html/ClassModule.html#method-sgd_step}{\code{neuralnetr::ClassModule$sgd_step()}}\out{</span>}
}
\out{</details>}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-new"></a>}}
\if{latex}{\out{\hypertarget{method-new}{}}}
\subsection{Method \code{new()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BatchNorm$new(m, seed)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-forward"></a>}}
\if{latex}{\out{\hypertarget{method-forward}{}}}
\subsection{Method \code{forward()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BatchNorm$forward(A)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-backward"></a>}}
\if{latex}{\out{\hypertarget{method-backward}{}}}
\subsection{Method \code{backward()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BatchNorm$backward(dLdZ)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-step"></a>}}
\if{latex}{\out{\hypertarget{method-step}{}}}
\subsection{Method \code{step()}}{
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BatchNorm$step(lrate)}\if{html}{\out{</div>}}
}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-clone"></a>}}
\if{latex}{\out{\hypertarget{method-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BatchNorm$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
