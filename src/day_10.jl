module day10
using StatsBase # countmap
using Pipe: @pipe

include("inputs.jl")

ex0 = inputs.ex0_d10()
ex1 = inputs.ex1_d10()
input = inputs.input_d10()

function part1(input)
    adapter = sort(input)
    adapter = vcat(0, adapter, adapter[end]+3)
    diff_counts = countmap(diff(adapter))
    return diff_counts[1] * diff_counts[3]
end

@assert part1(ex1) == 220
@assert part1(input) == 2176
@info "Day 10, Part 1 answer: $(part1(input))"

# this one sucked. alg dev by trial and error.
function part2(input)
    adapter = sort(input)
    adapter = vcat(0, adapter, adapter[end]+3)
    diffs = diff(adapter) # 

    arrangements = @pipe join(diffs) |>
        split(_, '3', keepempty=false) |> # group the "1's" in arrays
        length.(_) |> # count the number of 1's
        binomial.(_, 2) .+ 1 |> # arrangment is num of 1's-choose-2 (plus the 3's)
        reduce(*, _) # all multiplied together. phew.
end

@assert part2(ex0) == 8
@assert part2(ex1) == 19208
@assert part2(input) == 18512297918464
@info "Day 10, Part 2 answer: $(part2(input))"
end