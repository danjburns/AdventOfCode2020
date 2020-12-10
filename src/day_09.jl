module day09

using Combinatorics, CircularArrays

include("inputs.jl")

ex = CircularArray(inputs.ex1_d9())
input = CircularArray(inputs.input_d9())


function first_invalid(input, pream_len=25)
    idx = 1
    window = input[idx:pream_len]
    next = input[pream_len+1]

    while next ∈ sum.(combinations(window, 2))
        idx += 1
        window = input[idx:(idx+pream_len)]
        next = input[pream_len+1+idx]
    end
    return next
end    

@assert first_invalid(ex, 5) == 127
@assert first_invalid(input) == 556543474
@info "Day 9, Part 1 answer: $(first_invalid(input))"

function find_contig(input, inval)
    for testdepth in 1:100
        for init in 1:length(input), len in 2:testdepth
            inval ∈ sum(input[range(init, length=len)]) && return input[range(init, length=len)]
        end
    end
end

inval = first_invalid(input)
part2(input, pream) = sum(extrema(find_contig(input, first_invalid(input, pream))))
@assert part2(ex, 5) == 62
@assert part2(input, 25) == 76096372
@info "Day 9, Part 2 answer: $(part2(input, 25))"

end