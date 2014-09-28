\name{bip_map}
\alias{bipartite.mapping}
\alias{bip_map}
\concept{Bipartite graph}
\concept{Two-mode network}
\title{Decide whether a graph is bipartite}
\description{This function decides whether the vertices of a network can
  be mapped to two vertex types in a way that no vertices of the same
  type are connected.}
\usage{
bip_map(graph)
}
\arguments{
  \item{graph}{The input graph.}
}
\details{
  A bipartite graph in igraph has a \sQuote{\code{type}} vertex
  attribute giving the two vertex types.

  This function simply checks whether a graph \emph{could} be
  bipartite. It tries to find a mapping that gives a possible division
  of the vertices into two classes, such that no two vertices of the
  same class are connected by an edge.

  The existence of such a mapping is equivalent of having no circuits of
  odd length in the graph. A graph with loop edges cannot bipartite.

  Note that the mapping is not necessarily unique, e.g. if the graph has
  at least two components, then the vertices in the separate components
  can be mapped independently.
}
\value{
  A named list with two elements:
  \item{res}{A logical scalar, \code{TRUE} if the can be bipartite,
    \code{FALSE} otherwise.}
  \item{type}{A possibly vertex type mapping, a logical vector. If no
    such mapping exists, then an empty vector.}
}
% e
% \references{}
\author{ Gabor Csardi \email{csardi.gabor@gmail.com} }
% \seealso{}
\examples{
## A ring has just one loop, so it is fine
g <- g_ring(10)
bip_map(g)

## A star is fine, too
g2 <- g_star(10)
bip_map(g2)

## A graph containing a triangle is not fine
g3 <- g_ring(10)
g3 <- add_edges(g3, c(1,3))
bip_map(g3)
}
\keyword{graphs}
