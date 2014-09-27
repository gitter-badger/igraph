
time_group("Fruchterman-Reingold layout")

time_that("FR layout is fast, connected", replications=10,
          init = { library(igraph); set.seed(42) },
          reinit = { g <- g_pa(400) },
          { l_fr(g, niter=500) })

time_that("FR layout is fast, unconnected", replications=10,
          init = { library(igraph); set.seed(42) },
          reinit = { g <- g_nm(400, 400) },
          { l_fr(g, niter=500) })
