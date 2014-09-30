
context("edgelist")

test_that("edgelist works", {
  library(igraph)
  g <- g_np(100, 3/100)
  e <- edgelist(g)
  g2 <- graph(t(e), n=vcount(g), dir=FALSE)
  expect_that(graph.isomorphic(g, g2), is_true())
})

