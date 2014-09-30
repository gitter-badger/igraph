
context("g_degseq")

test_that("g_degseq works", {
  library(igraph)

  gc <- function(graph) {
    clu <- comps(graph)
    induced_subgraph(graph, which(clu$membership==which.max(clu$csize)))
  }

  g <- gc(g_np(1000, 2/1000))

  nG <- g_degseq(degree(g), method="simple")
  expect_that(degree(nG), equals(degree(g)))

  nG <- g_degseq(degree(g), method="vl")
  expect_that(degree(nG), equals(degree(g)))
  expect_that(is.connected(nG), is_true())
  expect_that(is.simple(nG), is_true())

  #####

  g <- g_np(1000, 1/1000)

  nG <- g_degseq(degree(g), method="simple")
  expect_that(degree(nG), equals(degree(g)))

  g2 <- g_np(1000, 2/1000, dir=TRUE)

  nG2 <- g_degseq(degree(g, mode="out"),
                              degree(g, mode="in"),
                              method="simple")
  expect_that(degree(nG, mode="out"), equals(degree(g, mode="out")))
  expect_that(degree(nG, mode="in"), equals(degree(g, mode="in")))
})
