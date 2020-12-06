module day06

include("inputs.jl")
ex1 = inputs.ex1_d6()
ex2 = inputs.ex2_d6()
input = inputs.input_d6()

# Part 1 & 2
function count_yesses(input)
    yesses = [0, 0] # [p1:everyone's, p2:anyone's]
    for group in input
        testset = Set.(group)
        yesses += [ length(union(testset...)),      # p1
                    length(intersect(testset...))]  # p2
    end
    return yesses
end

# A more concise version of the above:
yeps = [sum(length(union(group...)) for group in input),
        sum(length(intersect(group...)) for group in input)]

@assert count_yesses(ex1)[1] == 6
@assert count_yesses(ex2)[1] == 11
@assert count_yesses(ex2)[2] == 6
@info "Day 6, Part 1 answer: $(count_yesses(input)[1])"
@info "Day 6, Part 2 answer: $(count_yesses(input)[2])"

end