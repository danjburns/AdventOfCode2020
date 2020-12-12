module day11

include("inputs.jl")

ex = inputs.ex_d11()
ex1 = inputs.ex1_d11()
ex2 = inputs.ex2_d11()
input = inputs.input_d11()

build_array(input) = collect.(input) |> x->hcat(x...) |> permutedims

function king(idx, grid, dirs)
    """ Neighbors as the King could reach."""
    return map(dirs) do dir
        checkbounds(Bool, grid, dir + idx) ? grid[idx+dir] : '.'
    end
end

function queen(idx, grid, dirs)
    """ Neighbors as the Queen could reach."""
    seat = idx # needed to reset the index after each inner loop
    neighbors = map(dirs) do dir
        idx = seat
        while checkbounds(Bool, grid, dir+idx)
            grid[dir+idx] ∈ ('L', '#') && return grid[dir+idx] 
            idx += dir
        end
        return '.'
    end
end

function step(grid, get_neighbors, seen)
    next_grid = copy(grid)
    dirs = [CartesianIndex(i,j) for i ∈ -1:1, j ∈ -1:1 if !(i==j==0)]
    for idx in CartesianIndices(grid)
        neighbors = get_neighbors(idx, grid, dirs)
        if grid[idx] == 'L' && ('#' ∉ neighbors)
            next_grid[idx] = '#'
        elseif grid[idx] == '#' && count(x->x=='#', neighbors) >= seen
            next_grid[idx] = 'L'
        end
    end
    return next_grid
end

function count_occupied(input, get_neighbors, seen)
    grid = build_array(input)
    grid_ = similar(grid)
    
    while !(grid_ == grid)
        grid_ = copy(grid)
        grid = step(grid_, get_neighbors, seen)
    end
    return count(x->x=='#', grid)
end

part1(input) = count_occupied(input, king, 4)
part2(input) = count_occupied(input, queen, 5)

@assert part1(ex) == 37
@assert part1(input) == 2273
@info "Day 11, Part 1 answer: $(part1(input))"

@assert part2(ex) == 26
@assert part2(input) == 2064
@info "Day 11, Part 2 answer: $(part2(input))"


end