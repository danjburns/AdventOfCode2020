module day06

include("inputs.jl") # input_d6, ex1_d6, ex2_d6
ex1 = inputs.ex1_d6()
ex2 = inputs.ex2_d6()
input = inputs.input_d6()

function count_yesses(input)
    yesses = []
    for group in input
        groupset = Set{Char}()
        for line in group, c in line
            push!(groupset, c)
        end
        push!(yesses, groupset)
    end
    return reduce(+, map(length, yesses))
end

@assert count_yesses(ex1) == 6
@assert count_yesses(ex2) == 11
@info "Day 5, Part 1 answer: $(count_yesses(input))"

end