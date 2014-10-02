
context("g_smallworld")

test_that("g_smallworld works", {

  library(igraph)

  for (i in 1:50) {
    p <- runif(1)
    d <- sample(1:3, 1)
    nei <- sample(2:5, 1)
    g <- g_smallworld(d, 10, nei, p, loops=FALSE)
    expect_that(any(which_loop(g)), is_false())
  }

})
