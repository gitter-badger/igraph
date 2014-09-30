
context("attributes")

test_that("assigning and querying attributes work", {
  library(igraph)

  ## Create a small ring graph, assign attributes
  ring <- g_formula( A-B-C-D-E-F-G-A )
  E(ring)$weight <- seq_len(ecount(ring))
  
  ## Query attributes
  expect_that(V(ring)$name, equals(LETTERS[seq_len(vcount(ring))]))
  expect_that(E(ring)$weight, equals(seq_len(ecount(ring))))
})

test_that("brackering works", {
  library(igraph)

  g <- graph(c(1,2, 1,3, 3,4))
  g <- set_vertex_attr(g, name="weight", value=1:vcount(g))
  g <- set_edge_attr(g, name="weight", value=1:ecount(g))
  g <- set_graph_attr(g, name="name", "foo")

  graph2 <- set_vertex_attr(g, name="weight",
                                 value=rep(1, vcount(g)))
  graph2 <- set_edge_attr(g, name="weight",
                               value=rep(1, ecount(g)))
  graph2 <- set_graph_attr(g, name="name", "foobar")

  expect_that(vertex_attr(g, name="weight"),
              equals(1:4))
  expect_that(edge_attr(g, name="weight"),
              equals(1:3))
  expect_that(graph_attr(g, name="name"), equals("foo"))
})

test_that("brackering works with a function", {
  library(igraph)
  library(testthat)

  g <- graph(c(1,2, 1,3, 3,4))
  g <- set_vertex_attr(g, name="weight", value=1:vcount(g))
  g <- set_edge_attr(g, name="weight", value=1:ecount(g))
  g <- set_graph_attr(g, name="name", "foo")

  run.test <- function(graph) {
    graph2 <- set_vertex_attr(graph, name="weight",
                                   value=rep(1, vcount(graph)))
    graph2 <- set_edge_attr(graph, name="weight",
                                   value=rep(1, ecount(graph)))
    graph2 <- set_graph_attr(graph, name="name", "foobar")
  }

  g2 <- run.test(g)
  expect_that(vertex_attr(g, name="weight"),
              equals(1:4))
  expect_that(edge_attr(g, name="weight"),
              equals(1:3))
  expect_that(graph_attr(g, name="name"), equals("foo"))
})

test_that("brackering works with shortcuts", {
  library(igraph)

  g <- graph(c(1,2, 1,3, 3,4))
  g <- set_vertex_attr(g, name="weight", value=1:vcount(g))
  g <- set_edge_attr(g, name="weight", value=1:ecount(g))
  g <- set_graph_attr(g, name="name", "foo")

  run.test <- function(graph) {
    V(graph)$weight <- rep(1, vcount(graph))
    E(graph)$weight <- rep(1, ecount(graph))
    graph$name <- "foobar"
  }

  g2 <- run.test(g)
  expect_that(vertex_attr(g, name="weight"),
              equals(1:4))
  expect_that(edge_attr(g, name="weight"),
              equals(1:3))
  expect_that(graph_attr(g, name="name"), equals("foo"))
})

## TODO: subsetting


