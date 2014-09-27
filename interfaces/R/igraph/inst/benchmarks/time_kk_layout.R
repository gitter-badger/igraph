
time_group("Kamada-Kawai layout")

time_that("KK layout is fast, connected", replications=10,
          init = { library(igraph); set.seed(42) },
          reinit = { g <- g_pa(400) },
          { l_kk(g, maxiter=500) })

time_that("KK layout is fast, unconnected", replications=10,
          init = { library(igraph); set.seed(42) },
          reinit = { g <- g_nm(400, 400) },
          { l_kk(g, maxiter=500) })

time_that("KK layout is fast for large graphs", replications=10,
          init = { library(igraph); set.seed(42) },
          reinit = { g <- g_pa(3000) },
          { l_kk(g, maxiter=500) })
