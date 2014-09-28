
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

deprecated("add.edges", add_edges)
deprecated("add.vertex.shape", add_shape)
deprecated("add.vertices", add_vertices)
deprecated("adjacent.triangles", count_triangles)
deprecated("articulation.points", articulation_points)
deprecated("aging.prefatt.game", g_pa_age)
deprecated("aging.ba.game", g_pa_age)
deprecated("aging.barabasi.game", g_pa_age)
deprecated("are.connected", is_connected_to)
deprecated("asymmetric.preference.game", g_pref_asym)
deprecated("autocurve.edges", make_curves)
deprecated("average.path.length", avg_path_len)
deprecated("ba.game", g_pa)
deprecated("barabasi.game", g_pa)
deprecated("biconnected.components", biconn_comps)
deprecated("bipartite.mapping", bip_map)
deprecated("bipartite.projection", bip_proj)
deprecated("bipartite.projection.size", bip_proj_size)
deprecated("bipartite.random.game", g_np_bip)
deprecated("blockGraphs", g_blocks)
deprecated("callaway.traits.game", g_traits_callaway)
deprecated("canonical.permutation", canon_perm)
deprecated("clique.number", clique_num)
deprecated("clusters", comps)
deprecated("code.length", code_len)
deprecated("cohesive.blocks", cohesive_blocks)
deprecated("connect.neighborhood", connect)
deprecated("contract.vertices", contract)
deprecated("convex.hull", convex_hull)
deprecated("count.multiple", count_multiple)
deprecated("cutat", cut_at)
deprecated("decompose.graph", decompose)
deprecated("degree.sequence.game", g_degseq)
deprecated("delete.edges", delete_edges)
deprecated("delete.vertices", delete_vertices)
deprecated("dendPlot", dend_plot)
deprecated("dendPlot.communities", dend_plot.communities)
deprecated("dendPlot.igraphHRG", dend_plot.igraphHRG)
deprecated("dominator.tree", dominator_tree)
deprecated("dyad.census", dyad_census)
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
deprecated("layout.auto", l_auto)
deprecated("layout.bipartite", l_bip)
deprecated("layout.circle", l_circle)
deprecated("layout.davidson.harel", l_dh)
deprecated("layout.drl", l_drl)
deprecated("layout.fruchterman.reingold", l_fr)
deprecated("layout.gem", l_gem)
deprecated("layout.graphopt", l_graphopt)
deprecated("layout.grid", l_grid)
deprecated("layout.kamada.kawai", l_kk)
deprecated("layout.lgl", l_lgl)
deprecated("layout.mds", l_mds)
deprecated("layout.merge", l_merge)
deprecated("layout.norm", l_norm)
deprecated("layout.random", l_random)
deprecated("layout.reingold.tilford", l_tree)
deprecated("layout.sphere", l_sphere)
deprecated("layout.star", l_star)
deprecated("layout.sugiyama", l_sugiyama)
deprecated("line.graph", g_line)
deprecated("piecewise.layout", l_comps)
deprecated("preference.game", g_pref)
deprecated("sbm.game", g_sbm)
deprecated("static.fitness.game", g_fitness)
deprecated("statis.power.law.game", g_fitness_pl)
deprecated("watts.strogatz.game", g_smallworld)
