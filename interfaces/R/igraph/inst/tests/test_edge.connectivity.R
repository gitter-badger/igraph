
context("edge_conn")

test_that("edge_conn works", {

  library(igraph)

  gc <- function(graph) {
    clu <- comps(graph)
    induced_subgraph(graph, which(clu$membership==which.max(clu$csize)))
  }

  g <- gc(g_np(30, 8/30))
  ec <- edge_conn(g)
  ecST <- Inf
  for (j in 1:(vcount(g)-1)) {
    for (k in (j+1):vcount(g)) {
      ec2 <- edge_conn(g, source=j, target=k)
      if (ec2 < ecST) { ecST <- ec2 }
    } 
  }
  expect_that(ec, equals(ecST))

####

  kite <- g_formula(Andre    - Beverly:Carol:Diane:Fernando,
                    Beverly  - Andre:Diane:Ed:Garth,
                    Carol    - Andre:Diane:Fernando,
                    Diane    - Andre:Beverly:Carol:Ed:Fernando:Garth,
                    Ed       - Beverly:Diane:Garth,
                    Fernando - Andre:Carol:Diane:Garth:Heather,
                    Garth    - Beverly:Diane:Ed:Fernando:Heather,
                    Heather  - Fernando:Garth:Ike,
                    Ike      - Heather:Jane,
                    Jane     - Ike)

  ec1 <- edge_conn(kite, source="Heather", target="Andre")
  ec2 <- edge_conn(kite, source="Garth", target="Andre")
  ec3 <- edge_conn(kite, source="Garth", target="Ike")
  expect_that(ec1, equals(2))
  expect_that(ec2, equals(4))
  expect_that(ec3, equals(1))
})
