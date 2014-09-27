
context("g_de_bruijn")

test_that("g_de_bruijn works", {

  library(igraph)
  g <- g_de_bruijn(2,1)
  g2 <- g_de_bruijn(2,2)
  g3 <- g_line(g)

  expect_that(graph.isomorphic(g3, graph(c(1,1,3,1,1,2,3,2,2,3,
                                           4,3,2,4,4,4))), is_true())
  expect_that(graph.isomorphic(g2, g3), is_true())
  
})
