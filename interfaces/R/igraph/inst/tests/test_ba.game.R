
context("g_pa")

test_that("g_pa works", {
  library(igraph)

  g <- g_pa(100, m=2)
  expect_that(ecount(g), equals(197))
  expect_that(vcount(g), equals(100))
  expect_that(is.simple(g), is_true())

  g2 <- g_pa(100, m=2, algorithm="psumtree-multiple")
  expect_that(ecount(g2), equals(198))
  expect_that(vcount(g2), equals(100))
  expect_that(is.simple(g2), is_false())

  g3 <- g_pa(100, m=2, algorithm="bag")
  expect_that(ecount(g3), equals(198))
  expect_that(vcount(g3), equals(100))
  expect_that(is.simple(g3), is_false())
})

test_that("g_pa can start from a graph", {
  library(igraph)
  set.seed(1234)
  
  g4 <- g_pa(10, m=1, algorithm="bag", start.graph=g_empty(5))
  expect_that(ecount(g4), equals(5))
  expect_that(vcount(g4), equals(10))
  expect_that(degree(g4), equals(c(2,0,0,0,1,2,1,1,2,1)))

  g6 <- g_pa(10, m=1, algorithm="bag", start.graph=g_star(10))
  expect_that(graph.isomorphic(g6, g_star(10)), is_true())
  
  g7 <- g_pa(10, m=3, algorithm="psumtree-multiple",
                start.graph=g_empty(5))
  expect_that(degree(g7, mode="out"), equals(c(0,0,0,0,0, 3,3,3,3,3)))

  g8 <- g_pa(10, m=3, algorithm="psumtree-multiple",
                start.graph=g_star(5))
  expect_that(degree(g8, mode="out"), equals(c(0,1,1,1,1, 3,3,3,3,3)))
  expect_that(graph.isomorphic(induced_subgraph(g8, 1:5), g_star(5)),
              is_true())

  g9 <- g_pa(10, m=3, algorithm="psumtree-multiple",
                start.graph=g_star(10))
  expect_that(graph.isomorphic(g9, g_star(10)), is_true())

  g10 <- g_pa(10, m=3, start.graph=g_empty(5))
  expect_that(degree(g10, mode="out"), equals(c(0,0,0,0,0, 3,3,3,3,3)))

  g11 <- g_pa(10, m=3, start.graph=g_star(5))
  expect_that(degree(g11, mode="out"), equals(c(0,1,1,1,1, 3,3,3,3,3)))
  expect_that(graph.isomorphic(induced_subgraph(g11, 1:5), g_star(5)),
              is_true())
  
  g12 <- g_pa(10, m=3, start.graph=g_star(10))
  expect_that(graph.isomorphic(g12, g_star(10)), is_true())
})
