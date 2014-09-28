
context("graph.coreness")

test_that("graph.coreness works", {
  library(igraph)
  g <- g_ring(10)
  g <- add_edges(g, c(1,2, 2,3, 1,3))
  gc <- graph.coreness(g)               
  expect_that(gc, equals(c(3,3,3,2,2,2,2,2,2,2)))
})
