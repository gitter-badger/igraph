
## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2014  Gabor Csardi <csardi.gabor@gmail.com>
##   334 Harvard street, Cambridge, MA 02139 USA
##
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
##   02110-1301 USA
##
## -----------------------------------------------------------------------

#' Generic function to create igraph graphs from various objects
#'
#' This is a generic function to create igraph graphs from other
#' R objects. The format of the input can be specified explicitly,
#' or will be detected automatically.
#' 
#' \code{make_graph_from} is an alias for \code{as_graph},
#' for readability. See the examples below.
#'
#' @section Adjancency matrices:
#'
#' Adjacency matrices are dense or sparse square matrices. They are
#' symmetric if the graph is undirected. Igraph supports dense and
#' sparse adjacency matrices, the latter with the \code{Matrix} package.
#'
#' @section Edge lists:
#'
#' An edge list is a matrix with two columns, each row corresponding to
#' an edge. They may contain numeric vertex ids or  
#'
#' @section Incidence matrices:
#'
#' @section Data frames:
#'
#' @section Adjacency lists:
#' 
#' @section Expressions:
#'
#' @section LCF notation:
#'
#' @section Detection of input format:
#'
#' The following algorithm is used to guess the input format. The algorithm
#' is designed to work in the cases where some features of the input hint
#' the input format. It is always a good idea to specify the format
#' of the input explicitly (see examples below) to eliminate any
#' ambiguity.
#' 
#' \enumerate{
#'   \item If the input has a class, and the class is
#'     \code{igraph_adjacency_matrix}, \code{igraph_edgelist},
#'     \code{igraph_incidence_matrix}, \code{igraph_adjlist},
#'     \code{igraph_literal}, \code{igraph_lcf} or \code{data.frame},
#'     then these specify the input format without ambiguity.
#'   \item Otherwise, if the input is a numeric or logical square matrix, and
#'     the column names match the row names, and are unique, it is assumed
#'     to be an adjacency_matrix.
#'   \item Otherwise, if it is a two-column dense matrix with column names
#'     \sQuote(from} and \sQuote{to}, then it is assumed to be an edge list.
#'   \item Otherwise, if the input is a numeric matrix with row and column
#'     names, and the row and column names are disjunct, then it is assumed
#'     to be an incidence matrix.
#'   \item Otherwise an error is reported.
#' }
#' 
#' @param x An object that will be converted to an igraph graph.
#' @param ... Additional arguments to the converter. Passed to the
#'   function that perform
#' @return An igraph graph.
#'
#' @aliases make_graph_from
#' @family igraph converters
#' @export
#' @examples
#' TODO

as_graph <- function(x, ...) {

  if (is(x, "igraph_adjacency_matrix")) {
    graph_from_adjacency_matrix(x, ...)
    
  } else if (is(x, "igraph_edgelist")) {
    graph_from_edgelist(x, ...)
    
  } else if (is(x, "data.frame")) {
    graph_from_data_frame(x, ...)
    
  } else if (is(x, "igraph_incidence_matrix")) {
    graph_from_incidence_matrix(x, ...)

  } else if (is(x, "igraph_adj_list")) {
    graph_from_adj_list(x, ...)
    
  } else if (is(x, "igraph_literal")) {
    graph_from_formula(x, ...)
    
  } else if (is(x, "igraph_lcf")) {
    graph_from_lcf(x, ...)

  } else {
    as_graph_auto(x, ...)
  }
}

## Try to guess the input type

as_graph_auto <- function(x, ...) {
  
}

#' Designate a matrix as an adjacency matrix
#'
#' The point of this function is that you can make sure
#' that the matrix is interpreted as an adjacency matrix
#' in igraph (as opposed to an edge list matrix, or incidence matrix).
#' 
#' @param x A matrix, to be designated as an adjacency matrix.
#' @return The matrix, with class \code{igraph_adjacency_matrix}.
#'
#' @family igraph converters
#' @export
#' @examples
#' # Inefficieent way to create a G(n,p) graph
#' sample(0:1, 100, replace = TRUE) %>%
#'   matrix(nrow = 10, ncol = 10) %>%
#'   adjacency_matrix() %>%
#'   as_graph() %>%
#'   str()

adjacency_matrix <- function(x) {
  ensure_adjacency_matrix(x) %>%
    add_class("igraph_adjacency_matrix")
}

#' Designate a matrix as an incidence matrix
#'
#' So that \code{\link{as_graph}} can create an igraph graph
#' from it.
#'
#' @param x Matrix to designate as an incidence matrix.
#' @return The matrix, with class \code{igraph_incidence_matrix}.
#'
#' @family igraph converters
#' @export
#' @examples
#' TODO

incidence_matrix <- function(x) {
  ensure_incidence_matrix(x) %>%
    add_class("igraph_incidence_matrix")
}

#' Designate a two-column matrix as an edge list
#'
#' The point of this function is that you can make sure
#' that the matrix is interpreted as an edge list matrix
#' in igraph (as opposed to an adjacency matrix, or incidence matrix).
#' 
#' @param x Matrix, numeric or character, to be designated as an edge list.
#' @return The matrix, wich class \code{igraph_edgelist}.
#'
#' @family igraph converters
#' @export
#' @examples
#' TODO

edgelist <- function(x) {
  ensure_edgelist(x) %>%
    add_class("igraph_edgelist")
}

#' Designate a list as an adjacency list
#'
#' @param x The list to mark as adjacency list.
#' @return The list, with class \code{igraph_adj_list}.
#'
#' @family igraph converters
#' @export
#' @examples
#' TODO

adj_list <- function(x) {
  ensure_adj_list(x) %>%
    add_class("igraph_adj_list")
}

#' Mark expression as a graph literal
#'
#' An expression marked as a graph literal can be passed to
#' \code{\link{as_graph}}.
#'
#' @param ... Expressions using the plus/minus notation. See
#'   \code{\link{graph_from_literal}}.
#' @return A list, marked as a graph literal.
#' 
#' @family igraph converters
#' @export
#' @examples
#' TODO

literal <- function(...) {
  list(...) %>%
    add_class("igraph_literal")
}

#' Create an LCF notation object for a graph
#'
#' LCF objects can be passed to \code{\link{as_graph}}.
#'
#' @param ... Parameters to pass to \code{\link{graph_from_lcf}}.
#' @return A list, marked as an LCF notation object.
#' 
#' @family igraph converters
#' @export
#' @examples
#' TODO

lcf <- function(...) {
  list(...) %>%
    add_class("igraph_lcf")
}
