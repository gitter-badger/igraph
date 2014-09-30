
context("min_st_sep")

test_that("min_st_sep works", {

  library(igraph)
  g <- graph.famous("Zachary")
  msts <- min_st_sep(g)
  is <- sapply(msts, is.separator, graph=g)
  expect_that(unique(is), equals(TRUE))

  ## TODO: check that it is minimal
})
