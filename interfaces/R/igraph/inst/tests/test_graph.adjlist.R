
context("graph.adjlist")

test_that("graph.adjlist works", {

  library(igraph)
  
  g <- g_np(100, 3/100)
  al <- get.adjlist(g)
  g2 <- graph.adjlist(al, mode="all")
  expect_that(graph.isomorphic(g, g2), is_true())

  ##
  
  g <- g_np(100, 3/100, dir=TRUE)
  al <- get.adjlist(g, mode="out")
  g2 <- graph.adjlist(al, mode="out")
  expect_that(graph.isomorphic(g, g2), is_true())
})
