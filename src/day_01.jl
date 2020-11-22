# expore functions needed for tests
export fuel, fuel_recurs

# Part 1
fuel(x) = round(x/3, RoundDown) - 2
masses = readlines("input/day01.txt") .|> x->parse(Int, x) 
@info "Day 1, Part 1 answer: $(sum(fuel.(masses)))"


# Part 2
function fuel_recurs(mass)
    fuel_mass = fuel(mass)
    fuel_mass < 0 ? 0 : fuel_mass + fuel_recurs(fuel_mass)
end
@info "Day 1, Part 2 answer: $(sum(fuel_recurs.(masses)))"