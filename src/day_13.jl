module day13

include("inputs.jl")

ex = inputs.ex_d13()
input = inputs.input_d13()

function part1(input)
    depart = parse(Int, input[1])
    buses = [parse(Int, bus) for bus in split(input[2], ",") if bus !="x"]
    waits = [bus - mod(depart, bus) for bus in buses]
    idx = argmin(waits)
    return waits[idx]*buses[idx]
end

@assert part1(ex) == 295
@assert part1(input) == 246
@info "Day 13, Part 1 answer: $(part1(input))"

# Part 2
# A hint pointed me to the Chinese Remainder Theorem. Alg from Rosetta Code

function chineseremainder(n::Array, a::Array)
    Π = prod(n)
    mod(sum(ai * invmod(Π ÷ ni, ni) * (Π ÷ ni) for (ni, ai) in zip(n, a)), Π)
end
 
function part2(input)
    en_buses = [(i, parse(Int, bus)) for (i, bus) in enumerate(split(input[2], ",")) if bus !="x"]
    offsets = first.(en_buses)                
    bus_ids = last.(en_buses)
    m = maximum(offsets)
    return chineseremainder(bus_ids, m .- offsets) - m + 1
end

@assert part2(ex) == 1068781
@assert part2(["None", "67,7,59,61"]) == 754018
@assert part2(["None", "67,x,7,59,61"]) == 779210
@assert part2(["None", "67,7,x,59,61"]) == 1261476
@assert part2(["None", "1789,37,47,1889"]) == 1202161486
@assert part2(input) == 939490236001473
@info "Day 13, Part 2 answer: $(part2(input))"

end