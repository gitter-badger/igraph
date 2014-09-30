
context("g_bip")

test_that("g_bip works", {
  library(igraph)

  I <- matrix(sample(0:1, 35, replace=TRUE, prob=c(3,1)), nc=5)
  g <- g_incidence(I)

  edges <- unlist(sapply(seq_len(nrow(I)), function(x) {
    w <- which(I[x,] != 0) + nrow(I)
    if (length(w)!=0) { as.vector(rbind(x, w)) } else { numeric() }
  }))
  g2 <- g_bip(seq_len(nrow(I)+ncol(I)) > nrow(I), edges)
  I2 <- incidence(g2)
  
  expect_that(I2, is_equivalent_to(I))
})
