
context("Stochastic block models")

test_that("Generating stochastic block models works", {

  library(igraph)
  pm <- matrix(1, nrow=2, ncol=2)
  bs <- c(4,6)
  g1 <- g_sbm(10, pref.matrix=pm, block.sizes=bs,
                 directed=FALSE, loops=FALSE)
  expect_that(graph.isomorphic(g1, g_full(10, directed=FALSE, loops=FALSE)),
              is_true())

  g2 <- g_sbm(10, pref.matrix=pm, block.sizes=bs,
                directed=FALSE, loops=TRUE)
  g2x <- g_full(10, directed=FALSE, loops=TRUE)
  expect_that(g2[sparse=FALSE], equals(g2x[sparse=FALSE]))

  g3 <- g_sbm(10, pref.matrix=pm, block.sizes=bs,
                 directed=TRUE, loops=FALSE)
  g3x <- g_full(10, directed=TRUE, loops=FALSE)
  expect_that(g3[sparse=FALSE], equals(g3x[sparse=FALSE]))

  g4 <- g_sbm(10, pref.matrix=pm, block.sizes=bs,
                 directed=TRUE, loops=TRUE)
  g4x <- g_full(10, directed=TRUE, loops=TRUE)
  expect_that(g4[sparse=FALSE], equals(g4x[sparse=FALSE]))
  
})
