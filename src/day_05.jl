module day05 

input() = readlines("../input/day05.txt")
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
function highest_id(;input=input()) 
    seat_ids = parse_bp.(input)
    return maximum(seat_ids)
end
@info "Day 5, Part 1 answer: $(highest_id())"

#Part 2
function find_seat(;input=input())
    seat_ids = parse_bp.(input)
    lo = minimum(seat_ids)
    hi = maximum(seat_ids)
    return [x for x in lo:hi if x ∉ seat_ids]
end
@info "Day 5, Part 2 answer: $(find_seat()[1])"

end