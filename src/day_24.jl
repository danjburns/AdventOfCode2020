module day24

include("inputs.jl")

ex = inputs.ex_d24()
input = inputs.input_d24()

# https://www.redblobgames.com/grids/hexagons/#coordinates-cube
struct Tile
    # cube coordinates for hex grid (see link)
    x::Int
    y::Int
    z::Int
end

function parse_input(input)
    rgx = r"(ne|se|sw|nw|e|w)"
    return map(split(input, "\n")) do line
        [m.match for m in eachmatch(rgx, line)]
    end
end

# Part 1
function move(t::Tile, dir)
    dir == "e"  && return Tile(t.x + 1, t.y - 1, t.z + 0)
    dir == "se" && return Tile(t.x + 0, t.y - 1, t.z + 1)
    dir == "sw" && return Tile(t.x - 1, t.y + 0, t.z + 1)
    dir == "w"  && return Tile(t.x - 1, t.y + 1, t.z + 0)
    dir == "nw" && return Tile(t.x + 0, t.y + 1, t.z - 1)
    dir == "ne" && return Tile(t.x + 1, t.y + 0, t.z - 1)
    error("Direction unknown: $dir")
end

function setup_tiles(input)
    
    lines = parse_input(input)
    flipped = Dict{Tile, Bool}() # false = white
    
    for line in lines
        tile = Tile(0, 0, 0)
        for dir in line
            tile = move(tile, dir)
        end
        if haskey(flipped, tile)
            flipped[tile] = !flipped[tile]
        else
            flipped[tile] = true
        end
    end
    return flipped
end

part1(input) = setup_tiles(input) |> f->sum(values(f))
@assert part1(ex) == 10
@info "Day 24, Part 1 answer: $(part1(input))"


# Part 2
get_neighs(t) = [
    # Tile(t.x + 0, t.y + 0, t.z + 0)
    Tile(t.x + 1, t.y - 1, t.z + 0)
    Tile(t.x + 0, t.y - 1, t.z + 1)
    Tile(t.x - 1, t.y + 0, t.z + 1)
    Tile(t.x - 1, t.y + 1, t.z + 0)
    Tile(t.x + 0, t.y + 1, t.z - 1)
    Tile(t.x + 1, t.y + 0, t.z - 1)
]

count_adj(tile, tiles) = sum([tiles[nei] for nei in get_neighs(tile) if nei ∈ keys(tiles)])

function exec(input, days=100)
    
    tiles = setup_tiles(input)
    
    for day in 1:days
        # get black tiles (used to determine candidates)
        blacks = [tile for (tile, color) in tiles if color == true]

        # create enough candidate tiles (don't forget to add curr tile, t)
        candidates = Set(Iterators.flatten([(t, get_neighs(t)...) for t in blacks]))

        # setup dictionary of tiles, colors for this iteration
        tiles = Dict{Tile, Bool}()
        for c in candidates
            tiles[c] = c ∈ blacks
        end

        # keep track of changing tiles for next iteration
        next_tiles = copy(tiles)
        
        for (tile, color) in tiles
            nb = count_adj(tile, tiles)
            if tiles[tile] && (nb == 0 || nb > 2)
                    # println("flipped $tile to white")
                    next_tiles[tile] = false
            elseif !tiles[tile] && nb == 2
                    # println("flipped ($tile, $(tiles[tile])) to black")
                    next_tiles[tile] = true
            end
        end
        tiles = copy(next_tiles) # apply the rules at the end of the iteration
        # println("Day $day: ", count(values(tiles)))
    end
    return tiles
end

part2(input) = exec(input) |> t->sum(values(t))
@assert part2(ex) == 2208
@info "Day 24, Part 2 answer: $(part2(input))"

end