
context("avg_path_len")

test_that("avg_path_len works", {
  library(igraph)

  apl <- function(graph) {
    sp <- shortest.paths(graph, mode="out")
    if (is.directed(graph)) {
      diag(sp) <- NA
    } else {
      sp[lower.tri(sp, diag=TRUE)] <- NA
    }
    sp[sp=="Inf"] <- NA
    mean(sp, na.rm=TRUE)
  }

  giant.component <- function(graph, mode="weak") {
    clu <- comps(graph, mode=mode)
    induced.subgraph(graph, which(clu$membership==which.max(clu$csize)))
  }
  
  g <- giant.component(g_np(100, 3/100))
  expect_that(apl(g), equals(avg_path_len(g)))

  g <- giant.component(g_np(100, 6/100, dir=TRUE), mode="strong")
  expect_that(apl(g), equals(avg_path_len(g)))

  g <- g_np(100, 2/100)
  expect_that(apl(g), equals(avg_path_len(g)))
  
  g <- g_np(100, 4/100, dir=TRUE)
  expect_that(apl(g), equals(avg_path_len(g)))
})
