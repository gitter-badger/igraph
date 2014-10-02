
context("g_edgelist")

test_that("g_edgelist works", {

  library(igraph)

  g <- g_np(50, 5/50)
  el <- as_edgelist(g)
  g2 <- g_edgelist(el, dir=FALSE)
  expect_that(graph.isomorphic(g, g2), is_true())

####

  g <- g_np(50, 5/50, dir=TRUE)
  el <- as_edgelist(g)
  g2 <- g_edgelist(el, dir=TRUE)
  expect_that(graph.isomorphic(g, g2), is_true())

####

  g <- g_np(26, 5/26, dir=TRUE)
  el <- as_edgelist(g)
  n <- letters[1:26]
  names(n) <- 1:26
  mode(el) <- "character"
  el[] <- n[el]
  g2 <- g_edgelist(el, dir=TRUE)
  expect_that(graph.isomorphic(g, g2), is_true())

})
