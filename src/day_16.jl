module day16

include("inputs.jl")

ex = inputs.ex_d16()
ex2 = inputs.ex2_d16()
input = inputs.input_d16()

function parse_input(input)
    lines = split(input, '\n', keepempty=false)
    
    fields = Dict{String, Array{Int}}()
    rgx = r"^([a-zA-Z]+\s*[a-zA-Z]+): (\d+)-(\d+) or (\d+)-(\d+)$"
    for line in lines
        if contains(line, ": ")
            m = match(rgx, line).captures
            r = parse.(Int, m[2:5])
            rng = [r[1]:r[2]..., r[3]:r[4]...]
            fields[m[1]] = rng
        end
    end

    your_ticket = findfirst(line->line=="your ticket:", lines) + 1 |>
                    x->getindex(lines, x) |>
                    x->split(x, ",") |>
                    x->parse.(Int, x)

    ntline = findfirst(line->line=="nearby tickets:", lines) + 1
    nearby_tickets = []
    for line in lines[ntline:end]
        push!(nearby_tickets, split(line, ",") |> x->parse.(Int, x))
    end
    
    return fields, your_ticket, nearby_tickets
end

# Part 1
function find_invalid_items(ticket, fields)
    # index of ticket entries that *are* found somewhere in fields' values:
    idx = [any([item ∈ value for value in values(fields)]) for item in ticket]
    return ticket[.!idx]
end

function part1(input)
    fields, _, nearby_tickets = parse_input(input)
    sum(sum.([find_invalid_items(ticket, fields) for ticket in nearby_tickets]))
end

@assert part1(input) == 21081
@info "Day 16, Part 1 answer: $(part1(input))"

# Part 2
isvalid(ticket, fields) = all([any([item ∈ value for value in values(fields)]) for item in ticket])


function part2(input)
    """Get the valid tickets"""
    f, yt, nts = parse_input(input)
    valid_nearbys = nts[map(x->isvalid(x, f), nts)]
    tickets = permutedims(hcat(valid_nearbys...))

    """Find the possible associations between fields and ticket positions."""
    assoc = Dict{String, Array{Int}}()
    for (field, range) in f # iterate over range of fields
        for (i, position) in enumerate(eachcol(tickets)) 
            """Check if each "pos" (a column in the tickets) is entirely contained 
            in the range of a field. If so, that pos could be associated with that 
            field."""

            if Set(intersect(position, range)) == Set(position)
                # println("Field ", field, " could be assoc. with pos ", i)
                haskey(assoc, field) ? push!(assoc[field], i) : assoc[field] = [i]
            end
        end
    end

    """Identify which pairs have only one valid assocation, remove those values from the other pairs and repeat."""
    while !all(length.(values(assoc)) .== 1)  # while all the values have >1 one el
        for (field, positions) in assoc
            if length(assoc[field]) == 1
                # println("Associate ", field, " with ", assoc[field])
                for (f, p) in assoc
                    if f != field
                        assoc[f] = filter(x->x!=assoc[field][1], assoc[f])
                    end
                end
            end
        end
    end

    """Puzzle answer asks to multiply your ticket where the identified positions starts with departure."""
    prod = 1
    for field in keys(assoc)
        if startswith(field, "departure")
            prod *= yt[assoc[field][1]]
        end
    end

    return prod
end

@assert part2(input) == 314360510573
@info "Day 16, Part 2 answer: $(part2(input))"

end