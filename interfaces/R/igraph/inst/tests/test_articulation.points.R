
context("articulation_points")

test_that("articulation_points works", {
  library(igraph)

  g <- g_full(5) + g_full(5)
  clu <- comps(g)$membership
  g <- add_edges(g, c(match(1,clu), match(2,clu)) )

  ap <- articulation_points(g)
  deg <- degree(g)
  expect_that(sort(which(deg==max(deg))), equals(sort(ap)))
})
