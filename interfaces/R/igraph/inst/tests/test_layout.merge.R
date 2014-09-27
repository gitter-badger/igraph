
context("l_merge")

test_that("l_merge works", {

  library(igraph)
  set.seed(42)

  g <- list(g_ring(10), g_ring(5))
  l <- lapply(g, l_mds)
  l

  lm <- l_merge(g, l)
  expect_that(is.matrix(lm), is_true())
  expect_that(ncol(lm), equals(2))
  expect_that(nrow(lm), equals(sum(sapply(g, vcount))))

##########

  ## Stress test
  for (i in 1:10) {
    g <- g_np(100, 2/100)
    l <- l_mds(g)
    expect_that(dim(l), equals(c(vcount(g), 2)))
  }

})
