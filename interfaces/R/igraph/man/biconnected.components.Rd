\name{biconn_comps}
\alias{biconnected.components}
\alias{biconn_comps}
\concept{Biconnected component}
\title{Biconnected components}
\description{Finding the biconnected components of a graph}
\usage{
biconn_comps(graph)
}
\arguments{
  \item{graph}{The input graph. It is treated as an undirected graph,
    even if it is directed.}
}
\details{
  A graph is biconnected if the removal of any single vertex (and its
  adjacent edges) does not disconnect it.

  A biconnected component of a graph is a maximal biconnected subgraph
  of it. The biconnected components of a graph can be given by the
  partition of its edges: every edge is a member of exactly one
  biconnected component. Note that this is not true for vertices: the same
  vertex can be part of many biconnected components.  
}
\value{
  A named list with three components:
  \item{no}{Numeric scalar, an integer giving the number of
    biconnected components in the graph.}
  \item{tree_edges}{The components themselves, a list of numeric
    vectors. Each vector is a set of edge ids giving the edges in a
    biconnected component. These edges define a spanning tree of the
    component.}
  \item{component_edges}{A list of numeric vectors. It gives all edges
  in the components.}
  \item{components}{A list of numeric vectors, the vertices of the
    components.}
  \item{articulation_points}{The articulation points of the graph. See
    \code{\link{articulation_points}}.}
}
%\references
\author{Gabor Csardi \email{csardi.gabor@gmail.com}}
\seealso{\code{\link{articulation_points}}, \code{\link{comps}},
  \code{\link{is.connected}}, \code{\link{vertex_conn}}}
\examples{
g <- disjoint_union( g_full(5), g_full(5) )
clu <- comps(g)$membership
g <- add_edges(g, c(which(clu==1), which(clu==2)))
bc <- biconn_comps(g)
}
\keyword{graphs}
