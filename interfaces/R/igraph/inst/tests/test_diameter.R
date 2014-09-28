
context("diameter")

test_that("diameter works", {

  library(igraph)

  gc <- function(graph) {
    clu <- comps(graph)
    induced.subgraph(graph, which(clu$membership==which.max(clu$csize)))
  }

#### Undirected
  
  g <- gc(g_np(30, 3/30))
  sp <- shortest.paths(g)
  expect_that(max(sp), equals(diameter(g)))

  g <- gc(g_np(100, 1/100))
  sp <- shortest.paths(g)
  sp[sp==Inf] <- NA
  expect_that(max(sp, na.rm=TRUE), equals(diameter(g)))

#### Directed

  g <- g_np(30, 3/30, dir=TRUE)
  sp <- shortest.paths(g, mode="out")
  sp[sp==Inf] <- NA
  expect_that(max(sp, na.rm=TRUE), equals(diameter(g, unconnected=TRUE)))

#### Weighted

  E(g)$weight <- sample(1:10, ecount(g), replace=TRUE)
  sp <- shortest.paths(g, mode="out")
  sp[sp==Inf] <- NA
  expect_that(max(sp, na.rm=TRUE), equals(diameter(g, unconnected=TRUE)))

#### Bug #680538

  g <- g_tree(30, mode="undirected")
  E(g)$weight <- 2
  expect_that(diameter(g, unconnected=FALSE), equals(16))
})
