module day03
using CircularArrays

include("inputs.jl")
ex = inputs.ex_d3
input = inputs.input_d3

# Part 1
function parsemap(input)
    map = split(input) .|> # array of strings "..##......."
    collect .|> # array of array of chars ['.', '.', '#', '#', ...]
    x->(x .=='#') |> # array of BitArray [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0]
    x->hcat(x...)    # array of Bools 0  0  1  1  0  0  0  0  0  0  0
    map = vcat(map...) |>
    CircularArray
end

function count_trees(input, slope=(3,1))
    map = parsemap(input)
    count = 0
    x, y = 1, 1
    while y<=size(map)[1]
        count += map[y, x] ? 1 : 0
        x += slope[1]
        y += slope[2]
    end
    return count
end

@assert count_trees(ex) == 7
@info "Day 3, Part 1 answer: $(count_trees(input))"

# Part 2
function assess_slopes(input)
    slopes = [(1,1), (3,1), (5,1), (7,1), (1,2)]
    counts = [count_trees(input, slope) for slope in slopes]
    return reduce(*, counts)
end

@assert assess_slopes(ex) == 336
@info "Day 3, Part 2 answer: $(assess_slopes(input))"

end