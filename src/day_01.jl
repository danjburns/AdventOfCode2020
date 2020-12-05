module day01

# Part 1
ex = [1721, 979, 366, 299, 675, 1456]

function sum_two_to_2020(input)
    for a in 1:length(input)-1, b in 1:a
        input[a] + input[b] == 2020 && return input[a] * input[b] 
    end
end

@assert sum_two_to_2020(ex) == 514579
input = readlines("../input/day01.txt") .|> x->parse(Int, x) 
@info "Day 1, Part 1 answer: $(sum_two_to_2020(input))"

# Part 2
function sum_three_to_2020(input)
    local i = 0
    for a in 1:length(input)-1, b in 1:(a-1), c in 1:b
        input[a] + input[b] + input[c] == 2020 && return input[a]*input[b]*input[c]
    end
end

@assert sum_three_to_2020(ex) == 241861950
@info "Day 1, Part 2 answer: $(sum_three_to_2020(input))"

end