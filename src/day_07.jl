module day07

using LightGraphs
using SimpleWeightedGraphs
using DataStructures

include("inputs.jl")

# Approach: problem is a search over a directed, weighted graph.

input = inputs.input_d7()
ex = inputs.ex1_d7()

function build_graph(input)
    """
    Builds weighted directed graph, g, noting which bags (src vertices) and can contain certain quantities (edge weights) of other bags (dest vertices). Since graph data type cannot store vertex labels, a dictionary is used to map bag names (strings) to vertex numbers."""
    
    g = SimpleWeightedDiGraph{Int, Int}()
    names_to_verts = Dict()

    function build_bagtag_dict(str)
        """ Builds dictionary of (bag_name=>vertex_number) pairs as a side effect (CODE SMELL). 
        Returns vertex number of bag_name in names_to_verts dict as an integer. 
        Creates new vertex if needed."""
        default = length(vertices(g))+1
        res = get!(names_to_verts, str, default)
        res == default && add_vertex!(g) # if node doesn't exist add new vert
        return res
    end
    for line in input
        thisbag, rest = split(line, " bags contain ")
        src_vert = build_bagtag_dict(thisbag)
        rest == "no other bags." && continue
        edges = map(split(rest, r" bags?(, |.)", keepempty=false)) do edge
            weight, innerbag = match(r"^(\d+) (.*)$", edge).captures
            weight = parse(Int, weight)
            dst_vert = build_bagtag_dict(innerbag)
            # add_edge!(g, src_vert, dst_vert, weight) || error("Couldn't add edge! ", join((thisbag, innerbag, dst_vert, length(g), src_vert, g), ", "))
            add_edge!(g, dst_vert, src_vert, weight) || error("Couldn't add edge! ", join((thisbag, innerbag, dst_vert, length(g), src_vert, g), ", "))
        end
    end
    verts_to_names = SortedDict([reverse(pair) for pair in pairs(names_to_verts)])
    g, names_to_verts, verts_to_names
end

# Part 1
function count_parents(g, start, parentset=Set{Int}())
    parents = neighbors(g, start)
    for parent in parents
        push!(parentset, parent)
        count_parents(g, parent, parentset)
    end
    return length(parentset)
end

function part1(input)
    g, ntv, vtn = build_graph(input)
    return count_parents(g, ntv["shiny gold"])
end

@assert part1(ex) == 4
@info "Day 7, Part 1 answer: $(part1(input))"

# Part 2
function count_child_bags(g, start)
    bagcount = 0
    children = inneighbors(g, start)
    for child in children
        # println("from parent: ", vtn[start], " to child: ", vtn[child], " with weight: ", g.weights[start, child])
        bagcount += g.weights[start, child] * (1 + count_child_bags(g, child))
    end
    return bagcount
end

function part2(input)
    g, ntv, vtn = build_graph(input)
    return count_child_bags(g, ntv["shiny gold"])
end

@assert part2(ex) == 32
@info "Day 7, Part 2 answer: $(part2(input))"


# Plots are always fun.
function plot_graph(g)
    gplot(SimpleDiGraph(g), nodelabel=values(rntn))
end


end