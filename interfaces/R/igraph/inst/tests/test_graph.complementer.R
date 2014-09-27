
context("graph.complementer")

test_that("graph.complementer works", {

  library(igraph)

  g <- g_np(50, 3/50)
  g2 <- graph.complementer(g)
  g3 <- graph.complementer(g2)
  expect_that(graph.isomorphic(g, g3), is_true())
  
})


