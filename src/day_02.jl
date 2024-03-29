module day02 
using Pipe: @pipe
using DataStructures

include("inputs.jl")
ex = inputs.ex_d2() # Lines are pairs of policy & passwords
input = inputs.input_d2()

struct pol_pw
    min::Int
    max::Int
    letter::Char
    password::String
end

# Part 1
function parse_line(line)
    policy, password = split(line, ": ")
    range, letter = split(policy, ' ')
    min_n, max_n = parse.(Int, split(range, '-'))
    return pol_pw(min_n, max_n, first(letter), password)
end

function is_valid(pp)
    counts = counter(pp.password)
    return pp.min <= counts[pp.letter] <= pp.max
end

count_valids(input) = count(is_valid, parse_line.(input))

@assert count_valids(ex) == 2
@info "Day 2, Part 1 answer: $(count_valids(input))"

# Part 2
function is_valid_p2(pp)
    return xor(pp.password[pp.min] == pp.letter,
    pp.password[pp.max] == pp.letter)
end

count_valids_p2(input) = count(is_valid_p2, parse_line.(input))
@assert count_valids_p2(ex) == 1
@info "Day 2, Part 2 answer: $(count_valids_p2(input))"

end