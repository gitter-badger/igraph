
## -----------------------------------------------------------------------
##
##   IGraph R package
##   Copyright (C) 2014  Gabor Csardi <csardi.gabor@gmail.com>
##   334 Harvard street, Cambridge, MA 02139 USA
##
##   This program is free software; you can redistribute it and/or modify
##   it under the terms of the GNU General Public License as published by
##   the Free Software Foundation; either version 2 of the License, or
##   (at your option) any later version.
##
##   This program is distributed in the hope that it will be useful,
##   but WITHOUT ANY WARRANTY; without even the implied warranty of
##   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##   GNU General Public License for more details.
##
##   You should have received a copy of the GNU General Public License
##   along with this program; if not, write to the Free Software
##   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
##   02110-1301 USA
##
## -----------------------------------------------------------------------

#' @importFrom ensurer ensures_that
NULL

## -----------------------------------------------------------------------
## Basic R classes

ensure_list <- ensures_that(is.list(.))

## -----------------------------------------------------------------------
## Matrices

ensure_matrix <- ensures_that(is.matrix(.) || is(x, "Matrix") ~
                              "is a dense or sparse matrix")

ensure_dense_matrix <- ensures_that(is.matrix(.) ~ "is a dense matrix")

ensure_sparse_matrix <- ensures_that(is(x, "Matrix") ~ "has class 'Matrix'")

ensure_square_matrix <- ensures_that(
  +ensure_matrix,
  nrow(.) == ncol(.) ~ "is a square matrix"
)

ensure_adjacency_matrix <- ensures_that(
  +ensure_matrix,
  +ensure_square_matrix
)

ensure_adj_list <- ensures_that(
  is.list(.),
  all(sapply(., is.numeric)) ~ "is a list of numeric vectors"
)

ensure_edgelist <- ensures_that(+ensure_dense_matrix, ncol(.) == 2)

ensure_incidence_matrix <- ensures_that(+ensure_matrix)
