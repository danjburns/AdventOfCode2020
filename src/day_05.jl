module day05 

include("inputs.jl")
input = inputs.input_d5()

lookup = Dict('B'=>'1', 'F'=>'0', 'R'=>'1', 'L'=>'0')

function parse_bp(bp)
    row = parse(Int, join(lookup[c] for c in bp[1:7]), base=2)
    col = parse(Int, join(lookup[c] for c in bp[8:end]), base=2)
    seat_id = 8*row + col
    return seat_id
end

@assert parse_bp("BFFFBBFRRR") == 567
@assert parse_bp("FFFBBBFRRR") == 119
@assert parse_bp("BBFFBBFRLL") == 820

# Part 1
function highest_id(input) 
    seat_ids = parse_bp.(input)
    return maximum(seat_ids)
end
@info "Day 5, Part 1 answer: $(highest_id(input))"

#Part 2
# function find_seat(;input=input())
function find_seat(input)
    seat_ids = parse_bp.(input)
    lo = minimum(seat_ids)
    hi = maximum(seat_ids)
    return [x for x in lo:hi if x ∉ seat_ids]
end
@info "Day 5, Part 2 answer: $(find_seat(input)[1])"

end