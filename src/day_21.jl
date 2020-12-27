module day21

using StatsBase: countmap

include("inputs.jl")

ex = inputs.ex_d21()
input = inputs.input_d21()

function parse_input(input)
    foods = split(input, "\n")

    return map(foods) do food
        rgx = r"(.*) \(contains (.*)\)"
        ing_str, alg_str = match(rgx, food).captures
        ingredients = String.(split(ing_str |> strip, " "))
        allergens = String.(split(alg_str |> strip, ", "))
        (; ingredients, allergens)
    end
end

# candidate dict mapping allergens to possible ingredients
function find_candidates(foods)
    candidates = Dict{String, Set{String}}()
    for food in foods
        for alg in food.allergens
            if haskey(candidates, alg)
                # push!(candidates[alg], (food.ingredients)...)
                candidates[alg] = intersect(candidates[alg], Set(food.ingredients))
            else
                candidates[alg] = Set(food.ingredients)
            end
        end
    end
    return candidates
end

# resolve candidates by mapping allergen to exactly one ingredient
function resolve_candidates(candidates)
    result = Dict()
    queue = collect(keys(candidates))

    while length(result) < length(candidates)
        allergen = popfirst!(queue)
        if length(candidates[allergen]) == 1
            ingredient = only(candidates[allergen])
            result[allergen] = ingredient
            for k in keys(candidates)
                if k != allergen
                    delete!(candidates[k], ingredient)
                end
            end
        else
            push!(queue, allergen)
        end
    end
    return result
end


# count non-allergen ingredient occurences
function count_safe_ingredients(foods, result)
    safe = []
    for food in foods, ingredient in food.ingredients
            if ingredient ∉ collect(values(result))
                push!(safe, ingredient)
            end
    end
    sum(values(countmap(safe)))
end

function part1(input)
    foods = parse_input(input)
    candidates = find_candidates(foods)
    result = resolve_candidates(candidates)
    count_safe_ingredients(foods, result)
end

@assert part1(ex) == 5
@info "Day 21, Part 1 answer: $(part1(input))"


function part2(input)
    foods = parse_input(input)
    candidates = find_candidates(foods)
    result = resolve_candidates(candidates)
    join([result[k] for k in sort(collect(keys(result)))], ",")
end

@assert part2(ex) == "mxmxvkd,sqjhc,fvjkl"
@assert part2(input) == "ppdplc,gkcplx,ktlh,msfmt,dqsbql,mvqkdj,ggsz,hbhsx"
@info "Day 21, Part 2 answer: $(part2(input))"

end