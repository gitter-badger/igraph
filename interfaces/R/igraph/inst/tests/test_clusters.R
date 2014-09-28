
context("comps")

test_that("comps works", {
  library(igraph)
  set.seed(42)
  
  gc <- function(graph) {
    cl <- comps(graph)
    induced.subgraph(graph, which(cl$membership==which.max(cl$csize)))
  }
  
  rg <- function(n) {
    gc(g_np(n, 1/n))
  }
  
  G <- lapply(1:30, function(x) rg(sample(100, 1)))
  Gsize <- sapply(G, vcount)

  allg <- graph.disjoint.union(G)
  clu <- comps(allg)

  expect_that(as.numeric(table(clu$membership)), equals(clu$csize))
  expect_that(sort(clu$csize), equals(sort(Gsize)))
  expect_that(clu$no, equals(length(G)))
})

test_that("comps names results", {
  library(igraph)

  g <- g_ring(10) + g_full(5)
  V(g)$name <- letters[1:15]

  clu <- comps(g)
  expect_that(names(clu$membership), equals(letters[1:15]))
})

test_that("groups works", {
  library(igraph)

  g <- g_ring(10) + g_full(5)
  gr <- groups(comps(g))

  expect_that(gr, equals(structure(list(`1` = 1:10, `2` = 11:15), .Dim = 2L,
                                   .Dimnames = list( c("1", "2")))))

  V(g)$name <- letters[1:15]
  gr <- groups(comps(g))

  expect_that(gr, equals(structure(list(`1` = letters[1:10],
                                        `2` = letters[11:15]), .Dim = 2L,
                                        .Dimnames = list(c("1", "2")))))
})
