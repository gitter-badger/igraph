
context("as_igraph")

test_that("it can create graphs from adjacency matrices", {

  A <- matrix(sample(0:1, 100, replace = TRUE), nrow = 10)
  A <- A + t(A)
  g1 <- adjacency_matrix(A) %>% as_graph()
  g2 <- graph_from_adjacency_matrix(A)
  expect_identical(g1, g2)

})

test_that("it can create graphs from edge lists", {

  el <- cbind(sample(1:10), sample(1:10))
  g1 <- edgelist(el) %>% as_graph()
  g2 <- graph_from_edgelist(el)
  expect_identical(g1, g2)

})

test_that("it can create graphs from data frames", {

  edges <- data.frame(from = sample(1:10), to = sample(1:10))
  vertices <- data.frame(id = 1:10, color = c("red", "blue"))
  g1 <- as_graph(edges, vertices = vertices)
  g2 <- graph_from_data_frame(edges, vertices = vertices)
  expect_identical(g1, g2)

})

test_that("it can create graphs from incidence matrices", {

  A <- matrix(sample(0:1, 50, replace = TRUE), nrow = 5)
  g1 <- incidence_matrix(A) %>% as_graph()
  g2 <- graph_from_incidence_matrix(A)
  expect_identical(g1, g2)
  
})

test_that("it can create graphs from adjacency lists", {
  
})

test_that("it can create graphs from literals", {

})

test_that("it can create graphs from LCF notation", {

})

test_that("it passes on extra parameters", {

})
