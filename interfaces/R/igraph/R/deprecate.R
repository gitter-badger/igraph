
#   IGraph R package
#   Copyright (C) 2014  Gabor Csardi <csardi.gabor@gmail.com>
#   334 Harvard street, Cambridge, MA 02139 USA
#   
#   This program is free software; you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation; either version 2 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#   
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc.,  51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301 USA
#
###################################################################

## For the future, right now, we do not warn or even message

deprecated <- function(old, new) {
  assign(old, new, envir = asNamespace(packageName()))
}

deprecated("aging.prefatt.game", g_pa_age)
deprecated("aging.ba.game", g_pa_age)
deprecated("aging.barabasi.game", g_pa_age)
deprecated("asymmetric.preference.game", g_pref_asym)
deprecated("ba.game", g_pa)
deprecated("barabasi.game", g_pa)
deprecated("bipartite.random.game", g_np_bip)
deprecated("blockGraphs", g_blocks)
deprecated("callaway.traits.game", g_traits_callaway)
deprecated("degree.sequence.game", g_degseq)
deprecated("establishment.game", g_traits)
deprecated("forest.fire.game", g_forestfire)
deprecated("graph.adjacency", g_adj_matrix)
deprecated("graph.adjlist", g_adj_list)
deprecated("graph.atlas", g_atlas)
deprecated("graph.bipartite", g_bip)
deprecated("graph.data.frame", g_df)
deprecated("graph.de.bruijn", g_de_bruijn)
deprecated("graph.edgelist", g_edgelist)
deprecated("graph.empty", g_empty)
deprecated("graph.extended.chordal.ring", g_chordal_ring)
deprecated("graph.formula", g_formula)
deprecated("graph.full", g_full)
deprecated("graph.full.bipartite", g_full_bip)
deprecated("graph.full.citation", g_full_cit)
deprecated("graph.graphdb", g_graphdb)
deprecated("graph.incidence", g_incidence)
deprecated("graph.isocreate", g_isoclass)
deprecated("graph.kautz", g_kautz)
deprecated("graph.lattice", g_lattice)
deprecated("graph.lcf", g_lcf)
deprecated("graph.neighborhood", g_ego)
deprecated("graph.star", g_star)
deprecated("graph.tree", g_tree)
deprecated("growing.random.game", g_growing)
deprecated("graph.ring", g_ring)
deprecated("grg.game", g_grg)
deprecated("interconnected.islands.game", g_islands)
deprecated("k.regular.game", g_k_reg)
deprecated("lastcit.game", g_last_cit)
deprecated("line.graph", g_line)
deprecated("preference.game", g_pref)
deprecated("sbm.game", g_sbm)
deprecated("static.fitness.game", g_fitness)
deprecated("statis.power.law.game", g_fitness_pl)
deprecated("watts.strogatz.game", g_smallworld)
