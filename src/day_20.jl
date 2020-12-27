# module day20

include("inputs.jl")

struct Tile1
    id::Int
    tile::Array{Int,2}
    edges::Dict{String,Int}
end

ex = inputs.ex_d20();
input = inputs.input_d20();

tiles_raw = split(ex, "\n\n")
tile_raw = tiles_raw[1]

function parse_tile(tile_raw)
    lines = split(tile_raw, "\n")
    id = parse(Int, lines[1][6:9])

    tile_s = replace.(lines[2:end], "."=>"0") .|>x->replace(x, "#"=>"1")
    tile = permutedims(vcat(hcat([[parse(Int, c) for c in line] for line in tile_s]...)))

    edges = Dict{}()
    edges["t"] = parse(Int, tile_s[1,:][1], base=2)
    edges["b"] = parse(Int, tile_s[end,:][1], base=2)
    edges["l"] = parse(Int, String([c[1] for c in tile_s]), base=2)
    edges["r"] = parse(Int, String([c[end] for c in tile_s]), base=2)

    return Tile1(id, tile, edges)
end

function rotate(tile)
    edges = Dict{}()
    edges["t"] = tile.edges["l"]
    edges["b"] = tile.edges["r"]
    edges["l"] = tile.edges["b"]
    edges["r"] = tile.edges["t"]
    return Tile1(tile.id, rotr90(tile.tile), edges)
end

function flip(tile)
    edges = Dict{}()
    edges["t"] = parse(Int, reverse(bitstring(tile.edges["t"])[end-9:end]), base=2)
    edges["b"] = parse(Int, reverse(bitstring(tile.edges["b"])[end-9:end]), base=2)
    edges["l"] = tile.edges["r"]
    edges["r"] = tile.edges["l"]
    return Tile1(tile.id, reverse(tile.tile, dims=2), edges)
end

apply(f, tile) = f(tile)


# parse(Int, reverse(bitstring(6)[end-11:end]), base=2)
# end