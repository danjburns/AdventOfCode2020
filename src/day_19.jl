module day19

using OffsetArrays  # rules ids are 0-indexed

include("inputs.jl")

struct Rule
    id::Int
    literal::Union{Char, Nothing}
    subrules::Union{Array{Array{Int,1},1}, Nothing}
end

ex = inputs.ex_d19();
input = inputs.input_d19();

function parse_input(input)
    rules_raw, msgs_raw = split(input, "\n\n", keepempty=false)
    rules = []

    for line in split(rules_raw, "\n")
        id, rest = split(line, ": ")
        id = parse(Int, id)
        literal, subrules = nothing, nothing

        if contains(rest, "\"")
            literal=rest[2]
        else 
            parts = contains(rest, "|") ? split(rest, " | ") : parts = [rest]
            subrules = [[parse(Int,n) for n in split(part)] for part in parts]
        end
        push!(rules, Rule(id, literal, subrules))
    end
    
    rules = OffsetArray(sort!(rules, by=x->x.id), 0:length(rules)-1)
    msgs = split(msgs_raw, "\n")
    return rules, msgs
end

"""
Returns true if msg matches rule 0.
"""
function check(msg, rules)

    # Queue of pairs (remaining string, remaining rules)
    q = Vector([(msg, [0])])

    while ~isempty(q)
        msg, rule_ids = popfirst!(q)

        # consumed whole msg and all rules simultaneously, so that's a match
        if isempty(msg) && isempty(rule_ids)
            return true
        # consumed msg or rules but not both. Dead end.
        elseif isempty(msg) || isempty(rule_ids)
            continue
        end
        
        # have both msg and rule_ids. So try first rule in our ids
        rule = rules[rule_ids[1]]
        rule_ids = rule_ids[2:end]
        
        # first rule is literal, so if it matches the first character, 
        # then add the rest of the msg and the rest of the rules to the queue
        if ~isnothing(rule.literal)
            if msg[1] == rule.literal
                push!(q, (msg[2:end], rule_ids))
            else
                continue
            end
        else
            for subrule_ids in rule.subrules
                push!(q, (msg, vcat(subrule_ids, rule_ids)))
            end
        end
    end

    return false
end

function part1(input) 
    rules, msgs = parse_input(input)
    return count([check(msg, rules) for msg in msgs])
end

@assert part1(ex) == 2
@info "Day 19, Part 1 answer: $(part1(input))"


function part2(input)
    input = replace(input, "8: 42"=>"8: 42 | 42 8") |> x->
            replace(x, "11: 42 31"=>"11: 42 31 | 42 11 31")
    rules, msgs = parse_input(input)
    return count([check(msg, rules) for msg in msgs])
end

@info "Day 19, Part 2 answer: $(part2(input))"

end