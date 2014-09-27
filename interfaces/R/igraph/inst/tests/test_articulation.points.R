
context("articulation.points")

test_that("articulation.points works", {
  library(igraph)

  g <- g_full(5) + g_full(5)
  clu <- clusters(g)$membership
  g <- add.edges(g, c(match(1,clu), match(2,clu)) )

  ap <- articulation.points(g)
  deg <- degree(g)
  expect_that(sort(which(deg==max(deg))), equals(sort(ap)))
})
