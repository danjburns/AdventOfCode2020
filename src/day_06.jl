module day06

include("inputs.jl") # input_d6, ex1_d6, ex2_d6
ex1 = inputs.ex1_d6()
ex2 = inputs.ex2_d6()
input = inputs.input_d6()

# Part 1 & 2
function count_yesses(input)
    yesses = [0, 0] # [p1:everyone's, p2:anyone's]
    for group in input
        testset = Set.(group)
        yesses[1] += length(union(testset...))
        yesses[2] += length(intersect(testset...))
    end
    return yesses
end

@assert count_yesses(ex1)[1] == 6
@assert count_yesses(ex2)[1] == 11
@assert count_yesses(ex2)[2] == 6
@info "Day 5, Part 1 answer: $(count_yesses(input)[1])"
@info "Day 5, Part 2 answer: $(count_yesses(input)[2])"

end