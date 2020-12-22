module day17

include("inputs.jl")

ex = inputs.ex_d17()
input = inputs.input_d17()

function parse_input(input, dim)
    input = split(input, "\n") .|> String
    a = [char=='#' for line in input for char in line]
    @assert rem(length(a), sqrt(length(a)))==0.0 # square-able dim
    side = Int(sqrt(length(a)))    
    input2d = reshape(a, (side, side)) |> permutedims
    if dim == 2
        return input2d
    elseif dim == 3
        return reshape(input2d, size(input2d)..., 1)
    elseif dim == 4
        return reshape(input2d, size(input2d)..., 1, 1)
    end
end


function count_actives(input, dim)
    cycles = 6
    parsed_input = parse_input(input, dim)

    grid_size = size(parsed_input) .+ (2*cycles)
    grid = zeros(Bool, grid_size)

    seed_loc = UnitRange.(cycles+1, cycles .+ size(parsed_input))
    grid[seed_loc...] = parsed_input

    adj = CartesianIndices((repeat([-1:1], dim)...,))

    next_grid = copy(grid)
    for cycle in 1:cycles
        for coord ∈ CartesianIndices(grid)
            n_adj = sum(get(grid, coord + a, 0) for a in adj) - grid[coord]
            if grid[coord] && n_adj ∈ [2, 3]
                # println("keep ", coord, "true")
                next_grid[coord] = true
            elseif grid[coord] && n_adj ∉ [2, 3]
                 next_grid[coord] = false
            elseif !grid[coord] && n_adj == 3
                # println("set ", coord, "from false to true")
                next_grid[coord] = true
            elseif !grid[coord] && n_adj != 3
                 next_grid[coord] = false
            end
        end
        grid .= next_grid
    end
    return sum(grid)
end

part1(input) = count_actives(input, 3)

@assert part1(ex) == 112
@info "Day 17, Part 1 answer: $(part1(input))"

part2(input) = count_actives(input, 4)
@assert part2(ex) == 848
@info "Day 17, Part 2 answer: $(part2(input))"

end
