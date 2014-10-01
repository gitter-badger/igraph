
context("density")

test_that("density works", {

  library(igraph)

  g <- g_np(50, 4/50)
  gd <- density(g)
  gd2 <- ecount(g) / vcount(g) / (vcount(g)-1) * 2
  expect_that(gd, equals(gd2))

####

  g <- g_np(50, 4/50, dir=TRUE)
  gd <- density(g)
  gd2 <- ecount(g) / vcount(g) / (vcount(g)-1)
  expect_that(gd, equals(gd2))

})
