
context("adj")

test_that("adj works", {

  library(igraph)

  g <- g_np(50, 1/50)
  A <- adj(g, sparse=FALSE)
  g2 <- g_adj_matrix(A, mode="undirected")
  expect_that(graph.isomorphic(g, g2), is_true())

###

  A <- adj(g, sparse=TRUE)
  g2 <- g_adj_matrix(A, mode="undirected")
  expect_that(graph.isomorphic(g, g2), is_true())

###

  g <- g_np(50, 2/50, directed=TRUE)
  A <- adj(g, sparse=FALSE)
  g2 <- g_adj_matrix(A)
  expect_that(graph.isomorphic(g, g2), is_true())

###

  A <- adj(g, sparse=TRUE)
  g2 <- g_adj_matrix(A)
  expect_that(graph.isomorphic(g, g2), is_true())

})
